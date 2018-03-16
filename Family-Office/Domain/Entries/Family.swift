//
//  Family.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Family: Decodable {

    public var uid: String = ""
    public var name: String = ""
    public var photo: Attachment?
    public var admin: String? = ""
    public var members = [FamilyMembership]()
    public var isSelected = false
 
    public init(name: String) {
        self.admin = ""
        self.members = []
        self.photo = nil
        self.name = name
        self.uid = ""
    }
    public init(from decoder: Decoder) throws {

        if  let values = try? decoder.container(keyedBy: CodingKeys.self) {

            name = try values.decode(String.self, forKey: .name)

            uid = try values.decode(String.self, forKey: .uid)

            photo = try! values.decodeIfPresent(Attachment.self, forKey: .photo)
            members = values.decodeSafely([FamilyMembership].self, forKey: .members) ?? []
        }

//        members = try values.decode()
    }

}

extension Family: Equatable {
    public static func == (lhs: Family, rhs: Family) -> Bool {
        return lhs.uid == rhs.uid
    }
}
