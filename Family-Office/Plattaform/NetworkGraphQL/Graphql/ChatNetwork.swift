//
//  ChatNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

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
    
    func sendMessage(chatId: String, mid: String, text: String) -> Observable<Chat> {
        return network.postItem(SendMessageMutation(chat: chatId, messageId: mid, text: text))
    }
}
