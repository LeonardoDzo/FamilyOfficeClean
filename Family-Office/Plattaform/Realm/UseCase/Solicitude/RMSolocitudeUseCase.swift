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

final class RMApplicationFamilyUseCase<Repository>: ApplicationFamilyUseCase where Repository: AbstractRepository, Repository.T == ApplicationFamily {

    private let repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    func getFamilyApplications() -> Observable<[ApplicationFamily]> {
        return repository.query(with: NSPredicate(format: "stype = 0"), sortDescriptors: [])
    }
    func save(solicitude: ApplicationFamily) -> Observable<Void> {
        return repository.save(entity: solicitude)
    }
}
