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
        let container = try decoder.container(keyedBy: Key.self)
        let rawValue = try container.decode(Int.self, forKey: .rawValue)
        switch rawValue {
        case 0:
            self = .Accepted
        case 1:
            self = .Pending
        default:
            throw CodingError.unknownValue
        }
    }
}
