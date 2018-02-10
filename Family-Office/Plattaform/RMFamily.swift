//
//  RMFamily.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
final class RMFamily: Object {
    dynamic var uid: String = ""
    dynamic var name: String = ""
    dynamic var members = List<RMUser>()
    
    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMFamily: DomainConvertibleType {
    func asDomain() -> Family {
        let mapMembers = Array(members.map({$0.asDomain()}))
        return Family(name: name, admin: "", members: mapMembers, uid: uid)
    }
}

extension Family: RealmRepresentable {
    func asRealm() -> RMFamily {
        let family = RMFamily()
        family.uid = uid
        family.name = name
        return family
    }
}
