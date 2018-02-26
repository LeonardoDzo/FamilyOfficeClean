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
    private let authUseCase: AuthUseCase
    private let navigator: DefaultAuthNavigator

    init(useCase: AuthUseCase, navigator: DefaultAuthNavigator) {

        self.authUseCase = useCase
        self.navigator = navigator
    }

    func transform(input: SignInviewModel.Input) -> SignInviewModel.Output {
        let errorTracker = ErrorTracker()
        let emailAndPassword = Driver.combineLatest(input.email, input.password)
        let activityIndicator = ActivityIndicator()
        let canLogin = Driver.combineLatest(emailAndPassword, activityIndicator.asDriver()) {
            return !$0.0.isEmpty && !$0.1.isEmpty && !$1
        }

        let login = loginAction(input, emailAndPassword, errorTracker, activityIndicator)
        let signUp = input.signUpTrigger
            .do(onNext: navigator.toSignUp)

        return Output(dismiss: login, loginEnabled: canLogin, signUp: signUp, emailpass: emailAndPassword, error: errorTracker.asDriver())
    }

    fileprivate func loginAction(_ input: SignInviewModel.Input, _ emailAndPassword: SharedSequence<DriverSharingStrategy, (String, String)>, _ errorTracker: ErrorTracker, _ activityIndicator: ActivityIndicator) -> SharedSequence<DriverSharingStrategy, User> {
        return input.loginTrigger.withLatestFrom(emailAndPassword).flatMapLatest({
            [unowned self] in
            UserDefaults().removeObject(forKey: "token")
            return self.authUseCase
                .signIn(email: $0.0, password: $0.1)
                .trackError(errorTracker)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
        })
            .do(onNext: { user in
                self.navigator.toPreHome(user: user)
            })
    }
}
extension SignInviewModel {
    struct Input {
        let signUpTrigger: Driver<Void>
        let loginTrigger: Driver<Void>
        var email: Driver<String>
        var password: Driver<String>
    }
    struct Output {
        let dismiss: Driver<User>
        let loginEnabled: Driver<Bool>
        let signUp: Driver<Void>
        let emailpass: Driver<(String, String)>
        let error: Driver<Error>
    }
}
