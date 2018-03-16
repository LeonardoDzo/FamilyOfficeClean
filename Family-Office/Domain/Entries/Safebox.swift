//
//  Safebox.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Safebox: Decodable {
    var uid: String = ""
    var user: User!
    var password_digest: String = ""
}
