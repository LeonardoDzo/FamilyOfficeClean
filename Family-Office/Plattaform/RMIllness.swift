//
//  RMIllness.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
final class RMIllness: Object {
    dynamic var uid: String = ""
    dynamic var creator: RMUser!
    dynamic var details: String = ""
    dynamic var family: RMFamily!
    dynamic var medicines: String = ""
    dynamic var name: String = ""
    dynamic var type : ILLNESSTYPE! = .Disease
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMIllness: DomainConvertibleType {
    
    func asDomain() -> Illness {
        var illness = Illness()
        illness.creator = creator.asDomain()
        illness.details = details
        illness.uid = uid
        illness.family = family.asDomain()
        illness.medicines = medicines
        illness.type = type
        illness.name = name
        return illness
    }
}

extension Illness: RealmRepresentable {
    func asRealm() -> RMIllness {
        let realm = try! Realm()
        return RMIllness.build({ (obj) in
            obj.details = details
            obj.family = realm.object(ofType: RMFamily.self, forPrimaryKey: family.uid)
            obj.creator = realm.object(ofType: RMUser.self, forPrimaryKey: creator.uid)
            obj.medicines = medicines
            obj.name = name
        })
    }
}
