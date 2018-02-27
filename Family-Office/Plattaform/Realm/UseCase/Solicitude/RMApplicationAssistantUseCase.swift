//
//  RMApplicationAssistantUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMApplicationAssistantUseCase<Repository>: ApplicationAssistantUseCase where Repository: AbstractRepository, Repository.T == ApplicationAssistant {
    
    
    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    

    func save(appAssistant: ApplicationAssistant) -> Observable<Void> {
        return repository.save(entity: appAssistant)
    }
    func getAssistantsApplications() -> Observable<[ApplicationAssistant]> {
        return repository.queryAll()
    }
}
