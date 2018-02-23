//
//  FamilySolicitude.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

@objc enum SOLICITUDE_TYPE: Int, Decodable {
    case Family,
         Assistant
}
extension SOLICITUDE_TYPE {
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
            self = .Family
        case 1:
            self = .Assistant
        default:
            throw CodingError.unknownValue
        }
    }
}


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

public struct Solicitude: Decodable {
    public var uid: String = ""
    var from: String! = ""
    var to: String! = ""
    var type: SOLICITUDE_TYPE! = .Family
    var status: STATUS_SOLICITUDE! =  .Pending
    var photo: Photo! = nil
    var details: String = ""
    
    public init(from decoder: Decoder) throws {
        if let values = try? decoder.container(keyedBy: CodingKeys.self) {
            if let assistant = try? values.decode(User.self, forKey: .assistant) {
                self.from = assistant.uid
                self.photo = assistant.photo
                self.details = ""
                self.type = .Assistant
            }
            if let family = try? values.decode(Family.self, forKey: .family) {
                self.from = family.uid
                self.photo = family.photo
                self.details = "Has sido invitado a la " + family.name
                self.type = .Family
            }
            if let user = try? values.decode(User.self, forKey: .user) {
                self.to = user.uid
            }
            status = try values.decode(STATUS_SOLICITUDE.self, forKey: .status)
        }
    }
    
    init() {
    }
    
}
