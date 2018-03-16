//
//  Chat.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Chat: Decodable {
    
    var family: Family?
    
    var group: ChatGroup?
    
    var uid: String = ""
    
    var lastMessage: ChatMessage?
    
    var members = [ChatMembership]()
    
    var messages = [ChatMessage]()
    
    public init(from decoder: Decoder) throws {
        
        if  let values = try? decoder.container(keyedBy: CodingKeys.self) {
            
            group = values.decodeSafelyIfPresent(ChatGroup.self, forKey: .group)
            
            uid = values.decodeSafely(String.self, forKey: .uid)!
            
            family = values.decodeSafelyIfPresent(Family.self, forKey: .family)
//            lastMessage = values.decodeSafelyIfPresent(ChatMessage.self, forKey: .lastMessage)
            members = values.decodeSafely([ChatMembership].self, forKey: .members) ?? []
        }
    }
    init(family: Family?, group: ChatGroup?, uid: String, lastMessage: ChatMessage?, members: [ChatMembership], messages: [ChatMessage]) {
        self.family = family
        self.group = group
        self.lastMessage = lastMessage
        self.members = members
        self.messages = messages
        self.uid = uid
    }

    enum CodingKeys: String, CodingKey {
        case family
        case uid = "id"
        case group
        case lastMessage = "last_message"
        case members
        case messages = "chat_messages"
    }
}

extension Chat {
    public static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.uid == rhs.uid
    }
}
