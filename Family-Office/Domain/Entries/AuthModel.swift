//
//  AuthModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

//enum AuthModelType:  Decodable {
//    case signInUser(AuthModel)
//    case createUser(AuthModel)
//}

public struct AuthModel: Codable {
    var user: User
    let token: String
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case user
        case token
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.user = try values.decode(User.self, forKey: .user)
        token = try values.decode(String.self, forKey: .token)
    }

    public func encode(to encoder: Encoder) throws {
    }
}
public struct SignUpModel: Codable {
    var user: User
    let token: String
    var error: String?
    
    enum CodingKeys: String, CodingKey {
        case user
    }
    enum SignInCodingKeys: String, CodingKey {
        case user
        case token
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let userContainer = try values.nestedContainer(keyedBy: SignInCodingKeys.self, forKey: .user)
        user = try userContainer.decodeIfPresent(User.self, forKey: .user) ??  userContainer.decode(User.self, forKey: .user)
        token = try userContainer.decode(String.self, forKey: .token)
    }
    
    public func encode(to encoder: Encoder) throws {
    }
}
