//
//  RMSolicitude.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
@objcMembers
final class RMSolicitude: Object {
    dynamic var uid : String = ""
    dynamic var from = ""
    dynamic var to = ""
    dynamic var status : STATUS_SOLICITUDE! = .Pending
    dynamic var stype : SOLICITUDE_TYPE! = .Family
    
    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMSolicitude : DomainConvertibleType {
    func asDomain() -> Solicitude {
        var solicitude = Solicitude()
        solicitude.from = from
        solicitude.status = status
        solicitude.to = to
        solicitude.uid = uid
        solicitude.type = stype
        return solicitude
    }
}

extension Solicitude: RealmRepresentable {
    func asRealm() -> RMSolicitude {
        return RMSolicitude.build({ (obj) in
            obj.uid = uid
            obj.stype = type
            obj.from = from
            obj.status = status
            obj.to = to
        })
    }
}
