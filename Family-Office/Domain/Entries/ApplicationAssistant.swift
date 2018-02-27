//
//  ApplicationBase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation


public struct ApplicationAssistant : Base, Decodable {
    
    var uid: String = ""
    
    var updated_at: Int! = 0
    
    var created_at: Int! = 0
    
    var assistant: User!
    
    var user: User!
    
    var status: STATUS_SOLICITUDE! = .Pending
    
    public init(from decoder: Decoder) throws {
        
        if  let values = try? decoder.container(keyedBy: CodingKeys.self) {
            uid = values.decodeSafely(.uid)!
            assistant = values.decodeSafely(User.self, forKey: .assistant)
            user = values.decodeSafely(User.self, forKey: .user)
            status = values.decodeSafely(STATUS_SOLICITUDE.self, forKey: .status)
        }
        
    }
    init() {
    }
}
extension ApplicationAssistant: Equatable {
    public static func == (lhs: ApplicationAssistant, rhs: ApplicationAssistant) -> Bool {
        return lhs.uid == rhs.uid
    }
}
