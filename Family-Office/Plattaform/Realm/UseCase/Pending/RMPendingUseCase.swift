//
//  RMPendingUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMPendingUseCase<Repository>: PendingUseCase where Repository: AbstractRepository, Repository.T == Pending {

    private let repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    func delete(pending: Pending) -> Observable<Void> {
        return repository.delete(entity: pending)
    }
    func get() -> Observable<[Pending]> {
         return repository.queryAll()
    }
    func save(pending: Pending) -> Observable<Void> {
         return repository.save(entity: pending)
    }
}
