//
//  Insurance.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Insurance: Decodable {
    var uid: String = ""
    var name = ""
    var type: INSURANCETYPE = .cars
    var telephone = ""
    var policy = ""
    var attachment: Attachment? = nil
}
