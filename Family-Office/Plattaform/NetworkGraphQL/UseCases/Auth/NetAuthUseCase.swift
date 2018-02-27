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
    private let provider: RMUseCaseProvider!
    init(_ network: AuthNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }

    fileprivate func afterLogin(_ authmodel: (AuthModel), pass: String) {
        UserDefaults().set(authmodel.token, forKey: "token")
        UserDefaults().set(authmodel.user.uid, forKey: "uid")
        UserDefaults().set(authmodel.user.email, forKey: "email")
        UserDefaults().set(pass, forKey: "password")
        
        MainSocket.shareIntstance.channel.action("execute", with: UserSubscription(authmodel.user))
        MainSocket.shareIntstance.channel.action("execute", with: PendingAddedSubscription())
        self.provider.makeUseCase().save(user: authmodel.user).subscribe().dispose()
        
        NetUseCaseProvider().makeUseCase().getAssistants().subscribe().dispose()
        
        authmodel.user.families.forEach({ (family) in
            MainSocket.shareIntstance.channel.action("execute", with: FamilySubscription(family))
            self.provider.makeFamilyUseCase().save(fam: family).subscribe().dispose()

        })
    }

    func signIn(email: String, password: String) -> Observable<User> {
        return  network.signIn(email: email, password: password)
            .do(onNext: { authmodel in
                self.afterLogin(authmodel, pass: password)
            }).map({ (authmodel) -> User in
                return authmodel.user
            })
    }
    func signUp(user: User, password: String) -> Observable<User> {
        return network.signUp(email: user.email, name: user.name, phone: user.phone, password: password)
            .do(onNext: { authmodel in
                self.afterLogin(authmodel, pass: password)
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
