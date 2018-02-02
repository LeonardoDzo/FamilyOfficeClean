//
//  Family.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Family : Codable {
    
    public let uid: String
    public let name: String
    public let photo: Photo?
    public let admin: String
    public var members = [User]()
    
    public init(name: String,
                admin: String,
                members: [User],
                uid: String) {
        self.admin = admin
        self.members = members
        self.photo = nil
        self.name = name
        self.uid = uid
    }
}

extension Family: Equatable {
    public static func == (lhs: Family, rhs: Family) -> Bool {
        return lhs.name == rhs.name &&
            lhs.photo == rhs.photo &&
            lhs.admin == rhs.admin &&
            lhs.members == rhs.members
    }
}
