//
//  RMUser.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


@objcMembers
final class RMUser: Object {
    dynamic var uid: String = ""
    dynamic var birthday : Int = -1
    dynamic var email: String = ""
    dynamic var name: String = ""
    dynamic var phone: String = ""
    dynamic var photo: RMPhoto?
    dynamic var families = List<RMFamily>()
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMUser: DomainConvertibleType {
    func asDomain() -> User {
        let mapFamilies = Array(families.map({$0.asDomain()}))
        var user = User(uid: "", name: name, email: email)
        user.families = mapFamilies
        user.phone = phone
        user.photo = photo?.asDomain()
        return user
    }
}

extension User: RealmRepresentable {
    func asRealm() -> RMUser {
        return RMUser.build({ (object) in
            object.birthday = birth
            object.email = email
            object.name = name
            object.phone = phone
            object.photo = photo?.asRealm()
            object.families.append(objectsIn: families.map({$0.asRealm()}))
            object.uid = uid
        })
    }
}
