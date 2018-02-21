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
    var offline = false
    
    public init(_ offline: Bool = false) {
        self.offline = offline
        apollo = {
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed
            if let token = UserDefaults().value(forKey: "token") as? String {
                configuration.httpAdditionalHeaders = ["Authorization": token] // Replace `<token>`
            }
            let url = URL(string: "http://192.168.1.114:3000/graphql")!
            
            return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
        }()
    }
    
    public func makeAuthNetwork() -> AuthNetwork {
        let network = Network<AuthModel>(apollo)
        return AuthNetwork(network: network)
    }
    public func makeUserNetwork() -> UserNetwork {
        let network = Network<User>(apollo)
        return UserNetwork(network: network)
    }
    public func makeFamilyNetwork() -> FamilyNetwork {
        let network = Network<Family>(apollo)
        return FamilyNetwork(network: network)
    }

    public func makePendingNetwork() -> PendingNetwork {
        let network = Network<Pending>(apollo)
        return PendingNetwork(network: network)
    }
}
