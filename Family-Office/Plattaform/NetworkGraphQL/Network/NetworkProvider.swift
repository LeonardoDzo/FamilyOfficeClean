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
            let url = URL(string: Curl.url)!

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

    public func makeSApplicationsNetwork() -> ApplicationsNetwork {
        let network = Network<ApplicationFamily>(apollo)
        return ApplicationsNetwork(network: network)
    }
    
    public func makeApplicationsAssistantNetwork() -> ApplicationAssistantNetwork {
        let network = Network<ApplicationAssistant>(apollo)
        return ApplicationAssistantNetwork(network: network)
    }
    
    public func makeIllnessNetwork() -> IllnessNetwork {
        let network = Network<Illness>(apollo)
        return IllnessNetwork(network: network)
    }
}
