//
//  ApplicationAssistant.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension ApplicationAssistant: Mappable {
    
    enum CodingKeys: String, CodingKey {
        case user = "boss",
        assistant,
        status,
        uid = "id"
    }
}

