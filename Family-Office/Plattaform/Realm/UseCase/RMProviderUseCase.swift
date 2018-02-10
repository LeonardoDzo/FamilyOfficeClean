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

public final class RMUseCaseProvider: UseCaseProvider {
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
}
