//
//  User.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct User : Codable {
    
    public let address: Address?
    public let birth: Int?
    public let email: String
    public let name: String
    public let phone: String?
    public let uid: String
    public var photoURL: String? = "https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg"
    
    public init(address: Address,
                email: String,
                name: String,
                phone: String,
                uid: String,
                birth: Int,
                photoURL: String) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = phone
        self.uid = uid
        self.birth = birth
        self.photoURL = photoURL
        
    }
    public init(uid: String, name: String, email: String){
        self.name = name
        self.uid = uid
        self.email = email
        self.birth = -1
        self.phone = ""
        self.photoURL = ""
        self.address = nil
    }
}


extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid &&
            lhs.address == rhs.address &&
            lhs.email == rhs.email &&
            lhs.name == rhs.name &&
            lhs.phone == rhs.phone
    }
}
