//
//  RMChatUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

final class RMChatUseCase<Repository>: ChatUseCase where Repository: AbstractRepository, Repository.T == Chat {

    let realm = try! Realm()
    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(chatId: String, message: ChatMessage) -> Observable<Void> {
        
        if let chat = realm.object(ofType: RMChat.self, forPrimaryKey: chatId) {
            try! realm.write {
                chat.messages.append(message.asRealm())
            }
            return repository.save(entity: chat.asDomain())
        }
        
        return Variable(()).asObservable()
    }
    
    func get(byGroup: Bool? = false) -> Observable<[Chat]> {
        return byGroup! ? repository.query(with: NSPredicate(format: "name.count > %d", 0), sortDescriptors: []) :repository.query(with: NSPredicate(format: "name.count = %d", 0), sortDescriptors: [])
    }
    
    func create(chat: Chat) -> Observable<Chat> {
        MainSocket.shareIntstance.channel.action("execute", with: ChatMessageAdded(id: chat.uid))
        return repository.save(entity: chat).map({return chat})
    }
    
    func create(userId: String) -> Observable<Chat> {
        return Variable(Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])).asObservable()
    }
    
    func get(id: String) -> Observable<Chat> {
        return repository.query(uid: id)
    }
    func get(uid: String) -> Observable<Chat> {
        let myId = UserDefaults().value(forKey: "uid") as? String ?? ""
        return repository.queryAll().map({ chats in
            if let chat = chats.first(where: { (chat) -> Bool in
                return chat.members.contains(where: {$0.user?.uid == uid}) &&  chat.members.contains(where: {$0.user?.uid == myId})
            }) {
                return chat
            }
            return Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])
        })
    }
}

