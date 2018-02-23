//
//  UserUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetUserUseCase: UserUseCase  {
    
    private let network: UserNetwork

    init(network: UserNetwork) {
        self.network = network
    }

    func save(user: User) -> Observable<Void> {
        return Variable(()).asObservable()
    }
    
//    func delete(user: User) -> Observable<Void> {
//        
//    }
    func getUser(by id: String) -> Observable<User> {
        return Variable(User(uid: "", name: "", email: "")).asObservable()
    }
    func getUsers(byFamily: Family) -> Observable<[User]> {
        return Variable([]).asObservable()
    }
    func getUsers(phones: [String], rol: Int = 0) -> Observable<[User]> {
        return network.getUsers(phones:phones , rol:rol)
    }
}
