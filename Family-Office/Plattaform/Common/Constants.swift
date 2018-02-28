//
//  Constants.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

enum ip: String {
    case Dev = "0960d911.ngrok.io"
    case COT = "192.168.1.191"
}

let uri = ip.COT

extension ip {
    func getPort() -> String {
        switch self {
        case .Dev:
            return "/"
        case .COT:
            return ":3000/"
        }
    }
}
struct Constants {
    struct google {
        static let CLIENTID = "775446450455-us63mmd4kpla61h9edf4qjpbo7ao3gct.apps.googleusercontent.com"
    }
    struct url {
        static let url = "http://\(uri.rawValue.appending(uri.getPort()))graphql"
        static let ws = "ws://\(uri.rawValue.appending(uri.getPort()))websocket"
    }
}

typealias google = Constants.google
typealias Curl = Constants.url
