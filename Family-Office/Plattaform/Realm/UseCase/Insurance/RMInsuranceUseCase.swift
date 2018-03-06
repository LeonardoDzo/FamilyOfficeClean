//
//  RMInsuranceUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMInsuranceUseCase<Repository>: InsuranceUseCase where Repository: AbstractRepository, Repository.T == Insurance {
    private let repository: Repository!
    init(repository: Repository) {
        self.repository = repository
    }
    func get() -> Observable<[Insurance]> {
        return repository.queryAll()
    }
    func save(insurance: Insurance) -> Observable<Void> {
        return repository.save(entity: insurance)
    }
}
