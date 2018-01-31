//
//  SignInViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class SignInviewModel: ViewModelType {
    private let authUseCase : AuthUseCase
    private let navigator: DefaultAuthNavigator
    init(useCase: AuthUseCase, navigator: DefaultAuthNavigator) {
        self.authUseCase = useCase
        self.navigator = navigator
    }
    func transform(input: SignInviewModel.Input) -> SignInviewModel.Output {
        let emailAndPassword = Driver.combineLatest(input.email, input.password)
        let activityIndicator = ActivityIndicator()
        let canLogin = Driver.combineLatest(emailAndPassword, activityIndicator.asDriver()) {
            return !$0.0.isEmpty && !$0.1.isEmpty && !$1
        }
        let login = input.loginTrigger.withLatestFrom(emailAndPassword).flatMapLatest({
             [unowned self] in
            
            return self.authUseCase
                .signIn(email: $0.0, password: $0.1)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
        }).do(onNext: navigator.toPreHome)
        
        return Output(dismiss: login, loginEnabled: canLogin)
    }
}
extension SignInviewModel {
    struct Input {
        let loginTrigger: Driver<Void>
        let email: Driver<String>
        let password: Driver<String>
    }
    struct Output {
        let dismiss: Driver<User>
        let loginEnabled: Driver<Bool>
    }
}
