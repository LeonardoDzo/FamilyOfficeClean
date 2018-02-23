//
//  ServiceLocator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

class ServiceLocator {
    private var registry = [ObjectIdentifier: Any]()
    static var sharedLocator = ServiceLocator()
}
