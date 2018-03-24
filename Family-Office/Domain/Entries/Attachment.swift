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
    
    
    var isImage: Bool! {
        get {
            switch mime {
                case "image/jpeg", "image/png", "image/gift":
                    return true
                default:
                    return false
            }
        }
    }
    
    var normal: String! {
        get {
            return routes[1]
        }
    }
    
    var original: String! {
        get {
            return routes[0]
        }
    }
    
    var small: String! {
        get {
            return routes[2]
        }
    }
    
    func getUrlWithToken(type: Int) -> URL! {
        let token = UserDefaults().value(forKey: "token") as? String ?? ""
        var urlstring = ""
        switch type {
        case 0:
            urlstring = original
            break
        case 1:
            urlstring = normal
            break
        default:
            urlstring = small
            break
        }
        
        return URL(string: urlstring.appending("?token=\(token)"))!
    }
    
}
extension Attachment {
    public static func == (lhs: Attachment, rhs: Attachment) -> Bool {
        return lhs.url == rhs.url
    }
}


