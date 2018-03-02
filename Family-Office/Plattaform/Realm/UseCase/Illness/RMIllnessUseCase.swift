//
//  IllnessUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMIllnessUseCase<Repository>: IllnessUseCase where Repository: AbstractRepository, Repository.T == Illness {
    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    func save(illness: Illness) -> Observable<Void> {
        return repository.save(entity: illness)
    }
    func delete(illness: Illness) -> Observable<Void> {
        return repository.delete(entity: illness)
    }
    func get() -> Observable<[Illness]> {
        return repository.queryAll()
    }
    func edit(illness: Illness) -> Observable<Void> {
        return repository.save(entity: illness)
    }
    
}
