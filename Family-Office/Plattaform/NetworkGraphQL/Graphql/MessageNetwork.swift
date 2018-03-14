//
//  MessageNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class MessageNetwork {
    private let network: Network<ChatMessage>
    init(network: Network<ChatMessage>) {
        self.network = network
    }
    
    func sendMessage(chatId: String, mid: String, text: String) -> Observable<ChatMessage> {
        return network.postItem(SendMessageMutation(chat: chatId, messageId: mid, text: text))
    }
}
