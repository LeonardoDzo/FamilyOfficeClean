//
//  FindObject.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 14/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

final class FindObject<T: Decodable> {

    init() {
    }

    func decoder(data: Data) -> T? {
        let obj = try? JSONDecoder().decode([String: T].self, from: data).first?.value
        return obj!
    }

}
