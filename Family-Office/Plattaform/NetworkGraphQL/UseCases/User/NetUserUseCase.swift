//
//  UserUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetUserUseCase<Repository>: UserUseCase where Repository: AbstractRepository, Repository.T == User {
    private let network: UserNetwork
    private var offline = false
    private var repository: Repository!
    init(network: UserNetwork, repository: Repository, _ offline:Bool = false) {
        self.network = network
        self.repository = repository
        self.offline = offline
    }
//    func save(user: User) -> Observable<User> {
//        return network.
//    }
//    func delete(user: User) -> Observable<Void> {
//        
//    }
//        func getUser(by id: String) -> Observable<User> {
//            if offline {
//
//            }
//        }
//
}
