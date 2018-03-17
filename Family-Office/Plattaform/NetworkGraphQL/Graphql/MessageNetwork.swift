//
//  MessageNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Apollo
final class MessageNetwork {
    private let network: Network<ChatMessage>
    init(network: Network<ChatMessage>) {
        self.network = network
    }
    
    func sendMessage(chatId: String, message: ChatMessage) -> Observable<ChatMessage> {
        var files = [GraphQLFile]()
        if let data = message.data{
            let file = GraphQLFile(fieldName: "file", originalName: "\(UUID().uuidString).jpeg", mimeType: "image/jpeg", data: data)
            files.append(file)
            
        }
        return network.postItem(SendMessageMutation(chat: chatId, messageId: message.uid, text: message.text, file: nil), files: files)
    }
}
