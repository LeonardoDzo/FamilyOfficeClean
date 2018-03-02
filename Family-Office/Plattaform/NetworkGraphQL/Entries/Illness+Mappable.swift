//
//  Illness+Mappable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension Illness {
    enum CodingKeys: String, CodingKey {
        case uid = "id"
        case creator
        case details = "description"
        case family
        case medicines
        case name
        case type
    }
}
