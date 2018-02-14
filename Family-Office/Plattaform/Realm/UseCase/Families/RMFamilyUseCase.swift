//
//  FamilyUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class RMFamilyUseCase<Repository>: FamilyUseCase where Repository: AbstractRepository, Repository.T == Family  {
   
    

    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(fam: Family) -> Observable<Void> {
        return repository.save(entity: fam).do(onNext: {
            
        })
    }
    func get() -> Observable<[Family]> {
        return repository.queryAll()
    }
    
}
