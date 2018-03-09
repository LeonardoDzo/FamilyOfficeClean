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
    
    func save(chatId: String, message: Message) -> Observable<Void> {
        if let chat = realm.object(ofType: RMChat.self, forPrimaryKey: chatId) {
            chat.messages.append(message.asRealm())
            return repository.save(entity: chat.asDomain())
        }
        return Variable(()).asObservable()
    }
    
    func get(byGroup: Bool? = false) -> Observable<[Chat]> {
        return byGroup! ? repository.query(with: NSPredicate(format: "name.count > %d", 0), sortDescriptors: []) :repository.query(with: NSPredicate(format: "name.count = %d", 0), sortDescriptors: [])
    }
    
    func createt(chat: Chat) -> Observable<Chat> {
        return repository.save(entity: chat).map({return chat})
    }
}

