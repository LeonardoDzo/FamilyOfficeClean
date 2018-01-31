//
//  AuthModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct AuthModel: Codable {
    let user: User
    let token: String
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case signInUser
    }
    enum SignInCodingKeys: String, CodingKey {
        case user
        case token
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let signInContainer = try values.nestedContainer(keyedBy: SignInCodingKeys.self, forKey: .signInUser)
        user = try signInContainer.decode(User.self, forKey: .user)
        token = try signInContainer.decode(String.self, forKey: .token)
        
    }
    public func encode(to encoder: Encoder) throws {
    }
}
