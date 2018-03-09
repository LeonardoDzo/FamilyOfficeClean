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
    
    
    private let provider: RMUseCaseProvider!
    private let network: ChatNetwork!
    
    init( network: ChatNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    
    func get(byGroup: Bool?) -> Observable<[Chat]> {
        return Variable([]).asObservable()
    }
    
    func save(chatId: String, message: Message) -> Observable<Void> {
        return Variable(()).asObservable()
    }
    
    func createt(chat: Chat) -> Observable<Chat> {
        return Variable(Chat(family: nil, group: nil, uid: "", lastMessage: nil, members: [], messages: [])).asObservable()
    }
    
}
