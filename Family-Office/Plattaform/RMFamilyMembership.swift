//
//  RMFamilyMembership.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
final class RMFamilyMembership: Object {
    
    dynamic var uid: String = ""
    
    dynamic var addedAt = 0
    
    dynamic var family: RMFamily?
    
    dynamic var isAdmin = false
    
    dynamic var user: RMUser?
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMFamilyMembership: DomainConvertibleType {
    func asDomain() -> FamilyMembership {
        return FamilyMembership(uid: uid, addedAt: addedAt, family: family?.asDomain(), isAdmin: isAdmin, user: user?.asDomain())
    }
}
extension FamilyMembership: RealmRepresentable {
    func asRealm() -> RMFamilyMembership {
        return RMFamilyMembership.build({ (obj) in
            obj.addedAt = addedAt
            obj.user = user?.asRealm()
            obj.family = family?.asRealm()
            obj.uid = uid
            obj.isAdmin = isAdmin
        })
    }
}
