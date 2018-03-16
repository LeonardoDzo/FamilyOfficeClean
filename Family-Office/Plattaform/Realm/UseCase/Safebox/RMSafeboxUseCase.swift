//
//  RMSafeboxUseCase.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMSafeboxUseCase<Repository>: SafeboxUseCase where Repository: AbstractRepository, Repository.T == SafeboxAttachment {
    
    private let repository: Repository!
    init(repository: Repository) {
        self.repository = repository
    }
    
    func get(password: String) -> Observable<[SafeboxAttachment]>{
        return repository.queryAll()
    }
    
    func save(safeboxAttachment: SafeboxAttachment) -> Observable<Void> {
        return repository.save(entity: safeboxAttachment)
    }
}
