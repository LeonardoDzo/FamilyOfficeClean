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
    
    var lastMessage: Message?
    
    var members = [ChatMembership]()
    
    var messages = [Message]()

    enum CodingKeys: String, CodingKey {
        case family
        case uid = "id"
        case group
        case lastMessage = "last_message"
        case members
        case messages
    }
}

extension Chat {
    public static func == (lhs: Chat, rhs: Chat) -> Bool {
        return lhs.uid == rhs.uid
    }
}
