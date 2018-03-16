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
    dynamic var birthday: Int = -1
    dynamic var email: String = ""
    dynamic var name: String = ""
    dynamic var phone: String = ""
    dynamic var photo: RMAttachment?
    dynamic var families = List<RMFamilyMembership>()
    dynamic var user_type = 0

    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMUser: DomainConvertibleType {
    func asDomain() -> User {
        var user = User(uid: uid, name: name, email: email)
        user.user_type = user_type
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
            object.user_type = user_type
            object.families.append(objectsIn: families.map({$0.asRealm()}))
            object.uid = uid
        })
    }
}
