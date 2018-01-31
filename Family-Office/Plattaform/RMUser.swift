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
    dynamic var photoURL: String = ""
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMUser: DomainConvertibleType {
    func asDomain() -> User {
        return User(uid: self.uid, name: name, email: email)
    }
}

extension User: RealmRepresentable {
    func asRealm() -> RMUser {
        let user = RMUser()
        user.uid = uid
        user.name = name
        user.email = email
        return user
    }
}
