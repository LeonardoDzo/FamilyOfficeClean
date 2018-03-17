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

public final class NetUseCaseProvider: AuthUseCaseProvider, UseCaseProvider, EventsUseCaseProvider {

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

    public func makeApplicationUseCase() -> ApplicationUseCase {
        return NetApplicationUseCase(network: networkProvider.makeSApplicationsNetwork())
    }
    public func makeApplicationAssistantUseCase() -> ApplicationAssistantUseCase {
        return NetApplicationAssistantUseCase(network: networkProvider.makeApplicationsAssistantNetwork())
    }
    
    public func makeIllnessUseCase() -> IllnessUseCase {
        return NetIllnessUseCase(network: networkProvider.makeIllnessNetwork())
    }
    public func makeInsuranceUseCase() -> InsuranceUseCase {
        return NetInsuranceUseCase(network: networkProvider.makeInsuranceNetwork())
    }
    public func makeChatUseCase() -> ChatUseCase {
        return NetChatUseCase(network: networkProvider.makeChatNetwork(), mNetwork: networkProvider.makeChatMessageNetwork())
    }
    
    public func makeEventsUseCase() -> EventsUseCase {
        return NetEventsUseCase(network: networkProvider.makeEventsNetwork())
    }
}
