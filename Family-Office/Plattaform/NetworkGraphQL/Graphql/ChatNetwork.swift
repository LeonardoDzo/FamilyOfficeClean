//
//  ChatNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Apollo


final class ChatNetwork {
    private let network: Network<Chat>
    init(network: Network<Chat>) {
        self.network = network
    }
    
    func get() -> Observable<[Chat]> {
        return network.getItems(MyChatsQuery())
    }
    
    func createChat(uid: String) -> Observable<Chat> {
        return network.postItem(CreateChatMutation(user: uid))
    }
    
    func seenChat(chatId: String) -> Observable<Void> {
        return network.postItem(SeenChatMutation(chatId: chatId)).mapToVoid()
    }
  
}
