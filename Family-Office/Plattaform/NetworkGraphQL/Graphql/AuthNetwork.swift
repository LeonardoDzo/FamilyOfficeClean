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

    func signIn(email: String, password: String) -> Observable<AuthModel> {
        return network.postItem(SignInUserMutation(e: email, p: password))
    }

    func signUp(email: String, name: String, phone: String, password: String) -> Observable<AuthModel> {
        return network.postItem(SignUpMutation(name: name, email: email, password: password, phone: phone))
    }

}
