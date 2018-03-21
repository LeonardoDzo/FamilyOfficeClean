//
//  NetChatUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetChatUseCase: ChatUseCase {

    private let diposeBag = DisposeBag()
    private let provider: RMUseCaseProvider!
    private let network: ChatNetwork!
    private let mNetwork: MessageNetwork!
    
    init( network: ChatNetwork, mNetwork: MessageNetwork,  provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.mNetwork = mNetwork
        self.provider = provider
    }
    
    func get(byGroup: Bool?) -> Observable<[Chat]> {
        return network.get().do(onNext: { chats in
            chats.forEach({
                self.provider.makeChatUseCase().create(chat: $0, data: nil).subscribe().dispose()
            })
        })
    }
    
    func save(chatId: String, message: ChatMessage) -> Observable<Void> {
        return mNetwork.sendMessage(chatId: chatId, message: message).mapToVoid()
    }
    
    func create(chat: Chat, data: Data?) -> Observable<Chat> {
        return network.create(ids: chat.members.map({($0.user?.uid)!}), name: (chat.group?.name)!, photo: data).do(onNext:  {
            self.provider.makeChatUseCase().create(chat: $0, data: nil).subscribe().dispose()
        })
    }
    
    func create(userId: String) -> Observable<Chat> {
        return network.createChat(uid:userId).do(onNext: { chat in
            self.provider.makeChatUseCase().create(chat: chat, data: nil).subscribe().dispose()
        })
    }
    func get(uid: String) -> Observable<Chat> {
        return Variable(Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])).asObservable()
    }
    func get(id: String) -> Observable<Chat> {
        return Variable(Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])).asObservable()
    }
    
    func seenToChat(id: String) -> Observable<Void> {
        return network.seenChat(chatId:id)
    }
    
    
}
