//
//  Address.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Address : Codable {
    
    public var city: String
//    public let geo: Location
    public var street: String
    public var suite: String
    public var zipcode: String
    
    public init(city: String,
//                geo: Location,
                street: String,
                suite: String,
                zipcode: String) {
        self.city = city
//        self.geo = geo
        self.street = street
        self.suite = suite
        self.zipcode = zipcode
    }
}

extension Address: Equatable {
    public static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.city == rhs.city &&
//            lhs.geo == rhs.geo &&
            lhs.street == rhs.street &&
            lhs.suite == rhs.suite &&
            lhs.zipcode == rhs.zipcode
    }
}
