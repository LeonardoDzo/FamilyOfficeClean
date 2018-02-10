//
//  UserUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Realm
import RealmSwift

final class RMUserUseCase<Repository>: UserUseCase where Repository: AbstractRepository, Repository.T == User  {
    
    
    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
   
    func save(user: User) -> Observable<Void> {
        return repository.save(entity: user)
    }
}
