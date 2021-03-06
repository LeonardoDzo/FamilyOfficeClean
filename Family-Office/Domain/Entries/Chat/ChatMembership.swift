//
//  ChatMembership.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct ChatMembership: Decodable {
    
    var uid: String = ""
    
    var isAdmin = false
    
    var seenAt: Int
    
    var user: Sender?
    
    enum CodingKeys: String, CodingKey {
        case isAdmin = "is_admin"
        case uid = "id"
        case seenAt = "seen_at"
        case user
    }
}
