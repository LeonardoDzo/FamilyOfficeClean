//
//  NetworkProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Apollo
final class NetworkProvider {
    let apollo: ApolloClient!
    
    
    public init() {
        apollo = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed
            if let token = UserDefaults().value(forKey: "token") as? String {
                configuration.httpAdditionalHeaders = ["Authorization": token] // Replace `<token>`
            }
            let url = URL(string: "http://localhost:3000/graphql")!
            
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
    }
    
    public func makeAuthNetwork() -> AuthNetwork {
        let network = Network<AuthModel>(apollo)
        return AuthNetwork(network: network)
    }
}
