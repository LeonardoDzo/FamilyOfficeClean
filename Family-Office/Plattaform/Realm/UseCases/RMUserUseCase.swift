//
//  RMUserUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import RxSwift

final class RMUserUseCase<Repository>: UserUseCase where Repository: AbstractRepository, Repository.T == User {
   
    private let repository : Repository
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(user: User) -> Observable<Void> {
        return repository.save(entity: user)
    }
    
    func delete(user: User)  -> Observable<Void> {
        return repository.delete(entity: user)
    }
    func getUser(by id: String) -> Observable<User?> {
        return self.repository.query(uid: id).map({ (user) -> User in
            if user == nil {
                //GET USER NETWORK
            }
            return user!
        })
    }
    
}
