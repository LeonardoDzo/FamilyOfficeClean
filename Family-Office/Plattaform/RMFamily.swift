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
    dynamic var members = List<RMFamilyMembership>()
    dynamic var photo: RMAttachment?
    dynamic var isSelected = false
    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMFamily: DomainConvertibleType {
    func asDomain() -> Family {
        //let mapMembers = Array(members.map({$0.asDomain()}))
        var family = Family(name: name)
        family.uid = uid
        family.photo = photo?.asDomain()
        family.isSelected = isSelected
        return family
    }
}

extension Family: RealmRepresentable {
    func asRealm() -> RMFamily {

        let family = RMFamily()
        family.uid = uid
        family.name = name
        family.members.append(objectsIn: members.map({$0.asRealm()}))
        family.isSelected = isSelected
        family.photo = photo?.asRealm()
        return family
    }
}
