//
//  InsuranceType.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

@objc enum INSURANCETYPE: Int, Decodable, CustomStringConvertible  {
    case cars,
         homes,
         lifes,
         med
    
    var description: String {
        switch self {
        case .cars:
            return "Seguros de Autos"
        case .homes:
            return "Seguros de Hogar"
        case .lifes:
            return "Seguro de Vida"
        case .med:
            return "Seguro de Médico"
        }
    }
    
}
extension INSURANCETYPE {
    enum Key: CodingKey {
        case rawValue
    }
    enum CodingError: Error {
        case unknownValue
    }
    init(from decoder: Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(Int.self)
        
        switch rawValue {
        case 0:
            self = .cars
        case 1:
            self = .homes
        case 2:
            self = .lifes
        case 3:
            self = .med
        default:
            throw CodingError.unknownValue
        }
    }
}
