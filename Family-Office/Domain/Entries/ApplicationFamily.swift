//
//  ApplicationFamily.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 24/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
public struct ApplicationFamily: Base, Decodable {
    
    var uid: String = ""
    
    var updated_at: Int! = 0
    
    var created_at: Int! = 0
    
    var family: Family!
    
    var user: User!
    
    var status: STATUS_SOLICITUDE! = .Pending
    
}
extension ApplicationFamily: Equatable {
    public static func == (lhs: ApplicationFamily, rhs: ApplicationFamily) -> Bool {
        return lhs.uid == rhs.uid
    }
}
