//
//  RMApplicationAssistant.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

@objcMembers
class RMApplicationAssistant: Object {
    dynamic var uid: String = ""
    dynamic var assistant: RMUser!
    dynamic var user: RMUser!
    dynamic var status: STATUS_SOLICITUDE! = .Pending
    dynamic var updated_at: Int! = 0
    dynamic var created_at: Int! = 0
    
    override class func primaryKey() -> String {
        return "uid"
    }
}
extension RMApplicationAssistant: DomainConvertibleType {
    func asDomain() -> ApplicationAssistant {
        var solicitude = ApplicationAssistant()
        solicitude.updated_at = updated_at
        solicitude.assistant = assistant.asDomain()
        solicitude.user =  user.asDomain()
        solicitude.status = status
        solicitude.created_at = created_at
        return solicitude
    }
}
extension ApplicationAssistant: RealmRepresentable {
    func asRealm() -> RMApplicationAssistant {
        let realm = try! Realm()
        return RMApplicationAssistant.build({ (obj) in
            obj.uid = uid
            obj.assistant = realm.object(ofType: RMUser.self, forPrimaryKey: assistant.uid)
            obj.user = realm.object(ofType: RMUser.self, forPrimaryKey: user.uid)
            obj.status = status
            obj.updated_at = updated_at
            obj.created_at = created_at
        })
    }
}
