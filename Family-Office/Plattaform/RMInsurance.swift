//
//  RMInsurance.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class RMInsurance: Object {
    dynamic var uid: String = ""
    dynamic var name = ""
    dynamic var type = INSURANCETYPE.cars
    dynamic var telephone: String = ""
    dynamic var policy = ""
    dynamic var attachment: RMAttachment?
    
    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMInsurance: DomainConvertibleType {
    func asDomain() -> Insurance {
        var insurance = Insurance()
        insurance.uid = uid
        insurance.name = name
        insurance.attachment = attachment?.asDomain()
        insurance.type = type
        insurance.telephone = telephone
        insurance.policy = policy
        return insurance
    }
}
extension Insurance: RealmRepresentable {
    func asRealm() -> RMInsurance {
        return RMInsurance.build({ (obj) in
            obj.uid = uid
            obj.name = name
            obj.type = type
            obj.attachment = attachment?.asRealm()
            obj.telephone = telephone
            obj.policy = policy
        })
    }
}
