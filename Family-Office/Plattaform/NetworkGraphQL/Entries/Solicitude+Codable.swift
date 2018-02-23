//
//  Solicitude+Codable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension Solicitude : Mappable {
    
    enum CodingKeys: String, CodingKey {
        case assistant,
             user,
             family,
             status,
             uid = "id"
    }
}
