//
//  Message.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Message: Decodable {
    
    var attachment: Attachment?
    
    var uid: String = ""
    
    var sender: Sender?
    
    var seenAt = 0
    
    var text: String = ""
    
    enum CodingKeys: String, CodingKey {
        case attachment
        case uid = "id"
        case sender
        case seenAt = "sent_at"
        case text
    }
    
}
extension Message {
    public static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.uid == rhs.uid
    }
}
