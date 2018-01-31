//
//  Mapplable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

protocol Mappable  {
    
}
extension Mappable {
    func toJSON<T : Encodable>(_ object: T) throws  -> Dictionary<String, Any>? {
        let json : Any!
        let encodeData = try? JSONEncoder().encode(object)
        if let data = encodeData {
            json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let dic = json as? Dictionary<String,Any> {
                return dic
            }
        }
        return nil
    }
}
