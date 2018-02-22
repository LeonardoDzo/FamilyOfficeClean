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
    
    func getUser(by id: String) -> Observable<User> {
        return repository.query(uid: id)
    }
    func getUsers(byFamily: Family) -> Observable<[User]> {
        return repository.queryAll().filter({$0.contains(where: {$0.families.contains(where: {$0 == byFamily})})})
    }
}
