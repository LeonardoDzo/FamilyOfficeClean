//
//  ApplicationFamily.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 24/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
final class RMApplicationFamily: Object {
    dynamic var uid: String = ""
    dynamic var family: RMFamily!
    dynamic var user: RMUser!
    dynamic var status: STATUS_SOLICITUDE! = .Pending
    dynamic var updated_at: Int! = 0
    dynamic var created_at: Int! = 0
    
    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMApplicationFamily: DomainConvertibleType {
    func asDomain() -> ApplicationFamily {
        var solicitude = ApplicationFamily()
        solicitude.updated_at = updated_at
        solicitude.family = family.asDomain()
        solicitude.user = user.asDomain()
        solicitude.status = status
        solicitude.created_at = created_at
        return solicitude
    }
}
extension ApplicationFamily: RealmRepresentable {
    func asRealm() -> RMApplicationFamily {
        return RMApplicationFamily.build({ (obj) in
            obj.uid = uid
            obj.family = family.asRealm()
            obj.user = user.asRealm()
            obj.status = status
            obj.updated_at = updated_at
            obj.created_at = created_at
        })
    }
}
