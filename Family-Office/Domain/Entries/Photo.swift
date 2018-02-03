//
//  Photo.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Photo: Codable {
    public let name: String!
    public let mime: String!
    public let ext: String!
    public let url: String!
}
extension Photo: Equatable {
    public static func == (lhs: Photo, rhs: Photo) -> Bool {
        return lhs.name == rhs.name &&
            lhs.url == rhs.url
    }
}
