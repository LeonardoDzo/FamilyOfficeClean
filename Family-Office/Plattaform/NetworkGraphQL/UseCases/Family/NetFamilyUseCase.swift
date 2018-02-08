//
//  File.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetFamilyUseCase<Repository>: FamilyUseCase where Repository: AbstractRepository, Repository.T == Family  {
    private let network: FamilyNetwork!
    private let repository: Repository!

    init(_ network: FamilyNetwork, repository: Repository) {
        self.network = network
        self.repository = repository
    }
    func save(fam: Family) -> Observable<Family> {
        return network.createFamily(family: fam).do(onNext: { family in
            _ = self.repository.save(entity: family)
            family.members.forEach({ (user) in
                user.asRealm().families.append(family.asRealm())
                
            })
        })
    }
}
