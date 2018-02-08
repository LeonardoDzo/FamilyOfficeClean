//
//  AuthUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
final class NetAuthUseCase<Repository>: AuthUseCase where Repository: AbstractRepository, Repository.T == User {

    private let network: AuthNetwork!
    private let repository: Repository!
    
    init(_ network: AuthNetwork, repository: Repository) {
        self.network = network
        self.repository = repository
    }
    
    func signIn(email: String, password: String) -> Observable<User> {
        return  network.signIn(email:email, password: password)
            .do(onNext: { authmodel in
                 UserDefaults().set(authmodel.token, forKey: "token")
                 UserDefaults().set(authmodel.user.email, forKey: "email")
                 UserDefaults().set(password, forKey: "password")
                //Save token
               _ = self.repository.save(entity: authmodel.user).debug()
            }).map({ (authmodel) -> User in
                return authmodel.user
            })
    }
    func signUp(user:User, password: String) -> Observable<User> {
        return network.signUp(email: user.email, name: user.name, phone: user.phone!, password: password)
            .do(onNext: { authmodel in
                
            
              _ = self.repository.save(entity: user)
            }).map({ (authmodel) -> User in
                return authmodel.user
            })
    }
}

struct MapFromNever: Error {}
extension ObservableType where E == Never {
    func map<T>(to: T.Type) -> Observable<T> {
        return self.flatMap { _ in
            return Observable<T>.error(MapFromNever())
        }
    }
}
