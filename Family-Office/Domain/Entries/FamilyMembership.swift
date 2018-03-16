//
//  FamilyMembership.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct FamilyMembership: Decodable {
    
    var uid: String = ""
    
    var addedAt = 0
    
    var family: Family!
    
    var isAdmin = false
    
    var user: User!
    
    enum CodingKeys: String, CodingKey {
        case addedAt = "added_at"
        case uid = "id"
        case family
        case user
        case isAdmin = "is_admin"
    }
}
