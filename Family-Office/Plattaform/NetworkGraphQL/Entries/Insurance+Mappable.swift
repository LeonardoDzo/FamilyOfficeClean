//
//  Insurance+Mappable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension Insurance: Mappable{
    
    enum CodingKeys: String, CodingKey {
        case uid = "id"
        case telephone
        case name
        case type
        case policy
        case attachment
    }
}
