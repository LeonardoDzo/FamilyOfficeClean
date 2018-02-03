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
final class RMPhoto: Object {
    dynamic var url = ""
    /// Puede que sea un string con , lo cual significa tamaños de la imagen
    dynamic var ext = ""
    dynamic var mime = ""
    dynamic var name = ""
}
extension RMPhoto: DomainConvertibleType {
    func asDomain() -> Photo {
        return Photo(name: name, mime: mime, ext: ext, url: url)
    }
}

extension Photo: RealmRepresentable {
    var uid: String {
        return UUID().uuidString
    }
    func asRealm() -> RMPhoto {
        let photo = RMPhoto()
        photo.url = url
        photo.name = name
        photo.ext = ext
        photo.mime = mime
        return photo
    }
}
