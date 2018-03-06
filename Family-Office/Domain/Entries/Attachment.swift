//
//  Attachment.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Attachment: Codable {
    public var name: String = ""
    public var mime: String = ""
    public var ext: String = ""
    public var url: String = ""
    public var routes: [String] = []
}
extension Attachment {
    public static func == (lhs: Attachment, rhs: Attachment) -> Bool {
        return lhs.url == rhs.url
    }
}


