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

let me = {
    return  UserDefaults().value(forKey: "uid") as? String ?? ""
}()
final class RMChatUseCase<Repository>: ChatUseCase where Repository: AbstractRepository, Repository.T == Chat {
    func seenToChat(id: String) -> Observable<Void> {
        return  Variable(()).asObservable()
    }
    
    let disposeBag = DisposeBag()
    let realm = try! Realm()
    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(chatId: String, message: ChatMessage) -> Observable<Void> {
        
        if let chat = realm.object(ofType: RMChat.self, forPrimaryKey: chatId) {
            try! realm.write {
                if message.sender?.uid == me && message.status == .Sent {
                    realm.add(message.asRealm(), update: true)
                }else if message.sender?.uid == me {
                    NetUseCaseProvider().makeChatUseCase().save(chatId: chatId, message: message).subscribe().disposed(by: disposeBag)
                    chat.messages.append(message.asRealm())
                }else{chat.messages.append(message.asRealm())}
            }
           return repository.save(entity: chat.asDomain())
        }
        return Variable(()).asObservable()
    }
    
    func get(byGroup: Bool? = false) -> Observable<[Chat]> {
        return byGroup! ? repository.query(with: NSPredicate(format: "name != '' OR family != nil"), sortDescriptors: []) : repository.query(with: NSPredicate(format: "name == '' AND family == nil"), sortDescriptors: [])
    }
    
    func create(chat: Chat, data: Data? = nil) -> Observable<Chat> {
        MainSocket.shareIntstance.channel.action("execute", with: ChatMessageAdded(id: chat.uid))
        MainSocket.shareIntstance.channel.action("execute", with: chatMembershipChanged(chat: chat.uid))
        return repository.save(entity: chat).map({return chat})
    }
    
    func create(userId: String) -> Observable<Chat> {
        return Variable(Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])).asObservable()
    }
    
    func get(id: String) -> Observable<Chat> {
        return repository.query(uid: id)
    }
    
    func get(uid: String) -> Observable<Chat> {
        return repository.queryAll().map({ chats in
            if let chat = chats.filter({ $0.getType() == .OneToOne }).first(where: { (chat) -> Bool in
                return chat.members.contains(where: {$0.user?.uid == uid}) &&  chat.members.contains(where: {$0.user?.uid == me})
            }) {
                return chat
            }
            return Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])
        })
    }
    
  
}

