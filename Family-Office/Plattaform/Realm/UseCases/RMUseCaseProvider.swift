//
//  RMUseCaseProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

public final class RMUserUseCaseProvider: UserUseCaseProvider {
    private let configuration: Realm.Configuration
    
    public init(configuration: Realm.Configuration = Realm.Configuration()) {
        self.configuration = configuration
    }
    
    public func makeUseCase() -> UserUseCase {
        let repository = Repository<User>(configuration: configuration)
        return RMUserUseCase(repository: repository)
    }
    
}
