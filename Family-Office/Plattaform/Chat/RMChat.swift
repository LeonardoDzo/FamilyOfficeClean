//
//  RMChat.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
final class RMChat: Object {
    
    dynamic var family: RMFamily?
    
    dynamic var name = ""
    
    dynamic var photo: RMAttachment?
    
    dynamic var uid: String!
    
    dynamic var lastMessage: RMMessage?
    
    dynamic var members = List<RMSender>()
    
    dynamic var messages = List<RMMessage>()
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

