//
//  Solicitude+Codable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension ApplicationFamily: Mappable {

    enum CodingKeys: String, CodingKey {
        case user,
             family,
             status,
             uid = "id"
    }
}
