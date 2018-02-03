//
//  AuthNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift


public final class AuthNetwork {
    private let network: Network<AuthModel>
    
    init(network: Network<AuthModel>) {
        self.network = network
    }
    
    func signIn(email: String, password: String) -> Observable<User> {
       return network.postItem(SignInUserMutation(e: email, p: password))
        .map { (authmodel) -> User in
            UserDefaults().set(authmodel.token, forKey: "token")
            UserDefaults().set(authmodel.user.uid, forKey: "uid")
            _ = RMUserUseCaseProvider().makeUseCase().save(user: authmodel.user).map({ authmodel.user })
            return authmodel.user
        }
    }
    
    func signUp(email: String, name: String, phone: String, password: String) -> Observable<User> {
        return network.postItem(SignUpMutation(name: name, email: email, password: password, phone: phone)).map({ (authmodel) -> User in
            _ = RMUserUseCaseProvider().makeUseCase().save(user: authmodel.user).map({ authmodel.user })
            return authmodel.user
        })
    }
    
}
