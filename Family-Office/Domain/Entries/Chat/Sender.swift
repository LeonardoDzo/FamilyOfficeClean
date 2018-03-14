//
//  Sender.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Sender: Decodable {
    
    /// MARK: - Properties
    
    /// The unique String identifier for the sender.
    ///
    /// Note: This value must be unique across all senders.
    public var uid: String
    
    /// The display name of a sender.
    public var displayName: String
    
    /// The display photo of a sender
    public var photo: Attachment?
    
    
    enum CodingKeys: String, CodingKey {
        case uid = "id"
        case displayName = "name"
        case photo
    }

}

// MARK: - Equatable Conformance

extension Sender: Equatable {
    
    /// Two senders are considered equal if they have the same id.
    public static func == (left: Sender, right: Sender) -> Bool {
        return left.uid == right.uid
    }
    
}
