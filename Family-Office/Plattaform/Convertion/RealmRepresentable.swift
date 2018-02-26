//
//  RealmRepresentable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertibleType

    var uid: String {get}

    func asRealm() -> RealmType
}
