//
//  RMSender.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm

@objcMembers
final class RMSender: Object {
    
    dynamic var uid: String = ""
    
    dynamic var displayName: String = ""
  
    dynamic var photo: RMAttachment?
    
    override class func primaryKey() -> String {
        return "uid"
    }

}
extension RMSender: DomainConvertibleType {
    func asDomain() -> Sender {
        return Sender(uid: uid, displayName: displayName, photo: photo?.asDomain())
    }
}

extension Sender: RealmRepresentable {
    func asRealm() -> RMSender {
        return RMSender.build({ (obj) in
            obj.displayName = displayName
            obj.photo = photo?.asRealm()
            obj.uid = uid
        })
    }
}
