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

final class RMUserUseCase<Repository>: UserUseCase where Repository: AbstractRepository, Repository.T == User {
    func edit(user: User, photo: Data?) -> Observable<Void> {
        return Variable(()).asObservable()
    }
    

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
        let predicate = NSPredicate(format: "ANY families.uid == %@", byFamily.uid)
        return repository.query(with: predicate, sortDescriptors: [])
    }

    func getUsers(phones: [String] = [], rol: Int) -> Observable<[User]> {
        let predicate = NSPredicate(format: "user_type = %d", rol)
        return repository.query(with: predicate, sortDescriptors: [])
    }
    func getAssistants() -> Observable<[User]> {
        return repository.query(with: NSPredicate(format: "user_type = %d", 1), sortDescriptors: [])
    }
}
