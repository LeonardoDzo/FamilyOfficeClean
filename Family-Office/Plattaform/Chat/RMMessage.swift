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
    
    dynamic var seendAt: Int = 0
    
    dynamic var text: String = ""
    
    dynamic var status: MESSAGESTATUS = .Pending
    
    override class func primaryKey() -> String {
        return "uid"
    }
    
}
extension RMMessage: DomainConvertibleType {
    func asDomain() -> ChatMessage {
        return ChatMessage(attachment: attachment?.asDomain(), uid: uid, sender: sender?.asDomain(), seenAt: seendAt, text: text, status: status)
    }
}

extension ChatMessage: RealmRepresentable {
    func asRealm() -> RMMessage {
        let realm = try! Realm()
        return RMMessage.build({ (obj) in
            obj.attachment = attachment?.asRealm()
            obj.uid = uid
            obj.seendAt = seenAt
            obj.sender = realm.create(RMSender.self, value: sender?.asRealm(), update: true)
            obj.text = text
            obj.status = status
        })
    }
}

