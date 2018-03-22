//
//  RMPending.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
@objcMembers
final class RMPending: Object {
    dynamic var uid: String = ""
    dynamic var details: String = ""
    dynamic var title: String = ""
    dynamic var priority: PENDING_PRIORITY = .Low
    dynamic var done: Bool = false
    dynamic var type: Int = 0
    dynamic var seen: Bool = false
    dynamic var boss: String = ""
    dynamic var assistantId: String = ""
    dynamic var created_at: Int = 0
    dynamic var updated_at: Int = 0

    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMPending: DomainConvertibleType {
    
    func asDomain() -> Pending {
        var pending = Pending()
        pending.assistantId = assistantId
        pending.boss = boss
        pending.created_at = created_at
        pending.details = details
        pending.done = done
        pending.priority = priority
        pending.seen = seen
        pending.title = title
        pending.uid = uid
        return pending
    }

}
extension Pending: RealmRepresentable {
    func asRealm() -> RMPending {
        return RMPending.build({ (obj) in
            obj.assistantId = assistantId
            obj.boss = boss
            obj.created_at = created_at
            obj.details = details
            obj.done = done
            obj.priority = priority
            obj.seen = seen
            obj.title = title
            obj.uid = uid
        })
    }
}
