//
//  RMMessage.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
final class RMMessage: Object {
    
    dynamic var attachment: RMAttachment?
    
    dynamic var uid: String = ""
    
    dynamic var sender: RMSender!
    
    dynamic var seendAt: Int!
    
    dynamic var text: String = ""
    
    override class func primaryKey() -> String {
        return "uid"
    }
    
}
extension RMMessage: DomainConvertibleType {
    func asDomain() -> Message {
       return Message(attachment: attachment?.asDomain(), uid: uid, sender: sender.asDomain(), seenAt: seendAt, text: text)
    }
}

extension Message: RealmRepresentable {
    func asRealm() -> RMMessage {
        return RMMessage.build({ (obj) in
            obj.attachment = attachment?.asRealm()
            obj.uid = uid
            obj.seendAt = seenAt
            obj.sender = sender?.asRealm()
            obj.text = text
        })
    }
}

