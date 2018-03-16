//
//  RMSafebox.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class RMSafebox: Object {
    dynamic var uid: String! = ""
    dynamic var user: RMUser!
    dynamic var password_digest: String! = ""
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMSafebox: DomainConvertibleType {
    func asDomain() -> Safebox {
        return Safebox(uid: uid, user: user.asDomain(), password_digest: password_digest)
    }
}

extension Safebox: RealmRepresentable {
    func asRealm() -> RMSafebox {
        return RMSafebox.build({ (obj) in
            obj.uid = uid
            obj.user = user.asRealm()
            obj.password_digest = password_digest
        })
    }
}
