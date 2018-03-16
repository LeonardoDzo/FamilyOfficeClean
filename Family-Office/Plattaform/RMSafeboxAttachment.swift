//
//  RMSafeboxAttachment.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class RMSafeboxAttachment: Object {
    dynamic var uid: String = ""
    dynamic var name: String = ""
    dynamic var mime: String = ""
    dynamic var token: String = ""
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMSafeboxAttachment: DomainConvertibleType{
    func asDomain() -> SafeboxAttachment {
        return SafeboxAttachment(uid: uid, name: name, mime:mime, token:token)
    }
}

extension SafeboxAttachment: RealmRepresentable {
    func asRealm() -> RMSafeboxAttachment {
        return RMSafeboxAttachment.build({(obj) in
            obj.uid = uid
            obj.name = name
            obj.mime = mime
            obj.token = token
        })
    }
}
