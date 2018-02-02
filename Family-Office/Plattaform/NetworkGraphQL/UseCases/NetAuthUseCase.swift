//
//  AuthUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
final class NetAuthUseCase: AuthUseCase {

    private let network: AuthNetwork!
    
    init(_ network: AuthNetwork) {
        self.network = network
    }
    
    func signIn(email: String, password: String) -> Observable<User> {
        return  network.signIn(email:email, password: password)
    }
    func signUp(user:User, password: String) -> Observable<User> {
        return network.signUp(email: user.email, name: user.name, phone: user.phone!, password: password)
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
