//
//  User.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct User: Decodable {

    public var address: Address?
    public var birth: Int = -1
    public var email: String = ""
    public var name: String = ""
    public var phone: String = ""
    public var uid: String = ""
    public var photo: Attachment?
    public var families = [FamilyMembership]()
    public var nss = ""
    public var rfc = ""
    public var bloodyType = ""
    public var user_type = 0


    public init(uid: String, name: String, email: String) {
        self.name = name
        self.uid = uid
        self.email = email
        self.birth = -1
        self.phone = ""
        self.photo = nil
        self.address = nil
    }
    public init(name: String, email: String, phone: String) {
        self.name = name
        self.uid = ""
        self.email = email
        self.birth = -1
        self.phone = phone
        self.photo = nil
        self.address = nil
    }

    public init(from decoder: Decoder) throws {

        if  let values = try? decoder.container(keyedBy: CodingKeys.self) {
            name = try values.decode(String.self, forKey: .name)
            phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
            uid = try values.decode(String.self, forKey: .uid)
            birth = try values.decodeIfPresent(Int.self, forKey: .birth) ?? -1
            photo = try values.decodeIfPresent(Attachment.self, forKey: .photo)
            email = values.decodeSafely(.email) ?? ""
            address = try! values.decodeIfPresent(Address.self, forKey: .address)
            if let utype : String = values.decodeSafely(.user_type) {
                user_type = Int(utype)!
            }
            families = values.decodeSafely([FamilyMembership].self, forKey: .families) ?? []
        }

    }

}

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.uid == rhs.uid
    }
}
