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
    public var email: String
    public var name: String
    public var phone: String?
    public let uid: String
    public let photo: Photo?
    public var families = [Family]()
    public init(address: Address,
                email: String,
                name: String,
                uid: String,
                birth: Int,
                photoURL: String) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = nil
        self.uid = uid
        self.birth = birth
        self.photo = nil
        
    }
    public init(uid: String, name: String, email: String){
        self.name = name
        self.uid = uid
        self.email = email
        self.birth = -1
        self.phone = ""
        self.photo = nil
        self.address = nil
    }
    public init(name: String, email: String, phone: String){
        self.name = name
        self.uid = ""
        self.email = email
        self.birth = -1
        self.phone = phone
        self.photo = nil
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
