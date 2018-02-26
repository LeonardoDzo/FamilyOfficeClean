//
//  User+Codable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension User: Mappable {
    enum CodingKeys: String, CodingKey {
        case birth = "birthdate"
        case address
        case uid = "id"
        case phone
        case name
        case email
        case families
        case photo
        case user_type
    }

}
