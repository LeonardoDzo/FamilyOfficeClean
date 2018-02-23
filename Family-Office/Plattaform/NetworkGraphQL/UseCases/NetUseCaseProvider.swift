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

    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeAuthUseCase() -> AuthUseCase {
        return NetAuthUseCase(networkProvider.makeAuthNetwork())
    }
    public func makeUseCase() -> UserUseCase {
        return NetUserUseCase(network: networkProvider.makeUserNetwork())
    }
   
    public func makeFamilyUseCase() -> FamilyUseCase {
        return NetFamilyUseCase(networkProvider.makeFamilyNetwork())
    }
    
    public func makePendingUseCase() -> PendingUseCase {
        return NetPendingUseCase(network: networkProvider.makePendingNetwork())
    }
    
    public func makeSolicitudeUseCase() -> SolicitudeUseCase {
        return NetSolicitudeUseCase(network: networkProvider.makeSolicitudeUseCase())
    }
}

