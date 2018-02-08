//
//  UseCaseProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

public final class NetUseCaseProvider : AuthUseCaseProvider, UseCaseProvider {
   
    private let configuration: Realm.Configuration
    
    private let networkProvider: NetworkProvider
    
    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        networkProvider = NetworkProvider()
        self.configuration = configuration
    }
    
    public func makeAuthUseCase() -> AuthUseCase {
        let repository = Repository<User>(configuration: configuration)
        return NetAuthUseCase(networkProvider.makeAuthNetwork(), repository: repository)
    }
    public func makeUseCase() -> UserUseCase {
        let repository = Repository<User>(configuration: configuration)
        return NetUserUseCase(network: networkProvider.makeUserNetwork(), repository: repository)
    }
   
    public func makeFamilyUseCase() -> FamilyUseCase {
        let repository = Repository<Family>(configuration: configuration)
        return NetFamilyUseCase(networkProvider.makeFamilyNetwork(), repository: repository)
    }
    
}

