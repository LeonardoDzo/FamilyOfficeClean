//
//  RMMembership.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
final class RMChatMembership: Object {
    
    dynamic var uid: String = ""
    
    dynamic var isAdmin = false
    
    dynamic var seenAt = 0
    
    dynamic var user: RMSender?
    
    override class func primaryKey() -> String {
        return "uid"
    }
    
}

extension RMChatMembership: DomainConvertibleType {
    func asDomain() -> ChatMembership {
        return ChatMembership(uid: uid, isAdmin: isAdmin, seenAt: seenAt, user: user?.asDomain())
    }
}

extension ChatMembership: RealmRepresentable {
    func asRealm() -> RMChatMembership {
        return RMChatMembership.build({ (obj) in
            obj.user = user?.asRealm()
            obj.isAdmin = isAdmin
            obj.seenAt = seenAt
            obj.uid = uid
        })
    }
}
