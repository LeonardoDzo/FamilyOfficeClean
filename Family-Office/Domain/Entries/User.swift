//
//  User.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct User : Codable {
    
    public var address: Address?
    public var birth: Int = -1
    public var email: String = ""
    public var name: String = ""
    public var phone: String = ""
    public var uid: String = ""
    public var photo: Photo? = nil
    public var families: [Family] = [Family]()
    public var nss = ""
    public var rfc = ""
    public var bloodyType = ""
    public init(address: Address,
                email: String,
                name: String,
                uid: String,
                birth: Int,
                families: [Family] ) {
        self.address = address
        self.email = email
        self.name = name
        self.phone = ""
        self.uid = uid
        self.birth = birth
        self.photo = nil
        self.families = families
        
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
    
    public init(from decoder: Decoder) throws
    {
    
        if  let values = try? decoder.container(keyedBy: CodingKeys.self)  {
            name = try values.decode(String.self, forKey: .name)
            phone = try values.decodeIfPresent(String.self, forKey: .phone) ?? ""
            uid = try values.decode(String.self, forKey: .uid)
            birth = try values.decodeIfPresent(Int.self, forKey: .birth) ?? -1
            photo = try values.decodeIfPresent(Photo.self, forKey: .photo)
            email = try values.decode(String.self, forKey: .email)
            address = try! values.decodeIfPresent(Address.self, forKey: .address)
            
            families = try values.decodeIfPresent([[String:Family]].self, forKey: .families)?.flatMap({$0.values.filter({!$0.uid.isEmpty})}) ?? []
        }
        

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
