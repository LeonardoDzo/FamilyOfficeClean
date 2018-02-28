//
//  RMSolocitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMApplicationUseCase<Repository>: ApplicationUseCase where Repository: AbstractRepository, Repository.T == ApplicationFamily {
 

    private let repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    func getFamilyApplications() -> Observable<[ApplicationFamily]> {
        return repository.queryAll()
    }
    func save(solicitude: ApplicationFamily) -> Observable<Void> {
        return repository.save(entity: solicitude)
    }
    
    func approve(application: ApplicationFamily) -> Observable<Void> {
        return repository.save(entity: application)
    }
}
