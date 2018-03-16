//
//  SafeboxAttachment.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct SafeboxAttachment: Decodable {
    var uid: String = ""
    var name: String! = ""
    var mime: String! = ""
    var token: String! = ""
}
