//
//  RMProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RxSwift
import RealmSwift

public final class RMUseCaseProvider: UseCaseProvider, FamilyMembershipUseCaseProvider {

    private let configuration: Realm.Configuration

    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }

    public func makeFamilyUseCase() -> FamilyUseCase {
        let repository = Repository<Family>(configuration: configuration)
        return RMFamilyUseCase(repository: repository)
    }

    public func makeUseCase() -> UserUseCase {
         let repository = Repository<User>(configuration: configuration)
        return RMUserUseCase(repository: repository)
    }

    public func makePendingUseCase() -> PendingUseCase {
        let repository = Repository<Pending>(configuration: configuration)
        return RMPendingUseCase(repository: repository)
    }
    
    public func makeApplicationUseCase() -> ApplicationUseCase {
        let repository = Repository<ApplicationFamily>(configuration: configuration)
        return RMApplicationUseCase(repository: repository)
    }
    
    public func makeApplicationAssistantUseCase() -> ApplicationAssistantUseCase {
        let repository = Repository<ApplicationAssistant>(configuration: configuration)
        return RMApplicationAssistantUseCase(repository: repository)
    }
    
    public func makeIllnessUseCase() -> IllnessUseCase {
        let repository = Repository<Illness>(configuration: configuration)
        return RMIllnessUseCase(repository: repository)
    }
    
    public func makeInsuranceUseCase() -> InsuranceUseCase {
        let repository = Repository<Insurance>(configuration: configuration)
        return RMInsuranceUseCase(repository: repository)
    }
    public func makeFamilyMembershipUseCase() -> FamilyMembershipUseCase {
        let repository = Repository<FamilyMembership>(configuration: configuration)
        return RMFamilyMembershipUseCase(repository: repository)
    }
    
    public func makeChatUseCase() -> ChatUseCase {
        let repository = Repository<Chat>(configuration: configuration)
        return RMChatUseCase(repository: repository)
    }
}
