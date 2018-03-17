//
//  Message.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

@objc enum MESSAGESTATUS: Int {
    case Pending,
         Sent
}



public struct ChatMessage: Decodable {
    
    var attachment: Attachment?
    
    var uid: String = ""
  
    var sender: Sender?
    
    var seenAt = 0
    
    var text: String = ""
    
    var status: MESSAGESTATUS = .Pending
    
    var data: Data? = nil
    
    enum CodingKeys: String, CodingKey {
        case attachment
        case uid = "uuid"
        case sender
        case seenAt = "sent_at"
        case text
    }
    
}
extension ChatMessage {

    public static func == (lhs: ChatMessage, rhs: ChatMessage) -> Bool {
        return lhs.uid == rhs.uid
    }
    
}
