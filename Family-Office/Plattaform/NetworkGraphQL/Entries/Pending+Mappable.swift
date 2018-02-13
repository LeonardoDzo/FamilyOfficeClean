//
//  Pending+Mappable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
extension Pending: Mappable {
    enum CodingKeys: String, CodingKey {
        case title
        case uid = "id"
        case details
        case priority
        case done
        case seen
        case created_at
        case updated_at
    }
}
