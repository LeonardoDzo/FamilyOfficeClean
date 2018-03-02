//
//  Illness.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

@objc enum ILLNESSTYPE: Int, Decodable, CustomStringConvertible {
    case Disease,
    Pain
    
    var description: String {
        switch self {
        case .Disease:
            return "Enfermedad"
        default:
            return "Dolor"
        }
    }

}
extension ILLNESSTYPE {
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
            self = .Disease
        case 1:
            self = .Pain
        default:
            throw CodingError.unknownValue
        }
    }
}

public struct Illness : Decodable {
    var uid: String = ""
    var creator: User!
    var details: String = ""
    var family: Family!
    var medicines: String = ""
    var name: String = ""
    var type : ILLNESSTYPE! = .Disease
}
