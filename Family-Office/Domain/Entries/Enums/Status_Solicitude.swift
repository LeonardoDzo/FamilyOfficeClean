//
//  Status_Solicitude.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 25/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

@objc enum STATUS_SOLICITUDE: Int, Decodable {
    case Accepted,
    Pending
}

extension STATUS_SOLICITUDE {
    enum Key: CodingKey {
        case rawValue
    }
    enum CodingError: Error {
        case unknownValue
    }
    init(from decoder: Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(String.self)
        
        switch rawValue {
        case "Accepted":
            self = .Accepted
        case "Approved":
            self = .Accepted
        case "Pending":
            self = .Pending
        default:
            throw CodingError.unknownValue
        }
    }
}
