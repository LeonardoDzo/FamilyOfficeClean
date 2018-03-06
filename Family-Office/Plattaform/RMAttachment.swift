//
//  RMPhoto.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm


@objcMembers
class RealmString: Object {
    dynamic var value = ""
 
    convenience required init(_ value: String) {
        self.init()
        self.value = value
    }
}


@objcMembers
final class RMAttachment: Object {
    dynamic var url = ""
    /// Puede que sea un string con , lo cual significa tamaños de la imagen
    dynamic var ext = ""
    dynamic var mime = ""
    dynamic var name = ""
    dynamic var routes = List<RealmString>()
    
}
extension RMAttachment: DomainConvertibleType {
    func asDomain() -> Attachment {
        var attachment = Attachment()
        attachment.ext = ext
        attachment.mime = mime
        attachment.name = name
        attachment.routes = routes.map({$0.value})
        attachment.url = url
        return attachment
    }
}

extension Attachment: RealmRepresentable {
    var uid: String {
        return UUID().uuidString
    }
    func asRealm() -> RMAttachment {
        return RMAttachment.build({ (obj) in
            obj.ext = ext
            obj.mime = mime
            obj.name = name
            obj.url = url
            let map = routes.map({RealmString($0)})
            obj.routes.append(objectsIn: map)
        })
    }
}
