//
//  Family+Codable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

extension Family: Mappable  {
    enum CodingKeys: String, CodingKey {
        case name
        case uid = "id"
        case members
        case photo
        case __typename
    }
  
}


