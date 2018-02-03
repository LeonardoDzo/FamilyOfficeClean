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
        let user = RMUser()
        user.uid = uid
        user.name = name
        user.email = email
        user.photo = photo?.asRealm()
        return user
    }
}
