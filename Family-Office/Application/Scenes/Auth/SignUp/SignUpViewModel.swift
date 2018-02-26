//
//  SignUpViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

enum SignUpError: Error {
    case passwordErrors(reason: String)
}

final class SignUpviewModel: ViewModelType {

    private let authUseCase: AuthUseCase
    private let navigator: SignUpNavigator

    init(useCase: AuthUseCase, navigator: SignUpNavigator) {
        self.authUseCase = useCase
        self.navigator = navigator

    }
    func transform(input: SignUpviewModel.Input) -> SignUpviewModel.Output {
        let cancel = input.cancelTrigger.asDriver()
        let errorTracker = ErrorTracker()
        let pass = Driver.combineLatest(input.pass, input.rpass)
        let user = Driver.combineLatest(input.email, input.name, input.phone)
        let activityIndicator = ActivityIndicator()
        let canSave = Driver.combineLatest(user, pass, activityIndicator.asDriver()) { (arg, pass, _) in
            return !arg.0.isEmpty && !arg.1.isEmpty && !arg.2.isEmpty && pass.0 == pass.1
        }
        let params = Driver.combineLatest(user, pass)
        let save = input.saveTrigger.withLatestFrom(params).map { params -> (User, String) in
            return (User(name: params.0.1, email: params.0.0, phone: params.0.2), params.1.0)
            }.flatMapLatest {[unowned self] in
            return self.authUseCase
                .signUp(user: $0.0, password: $0.1)
                .trackError(errorTracker)
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
            }.do(onNext: navigator.toPreHome)

        return Output(dismiss: cancel, saveEnabled: canSave, saved: save, error: errorTracker.asDriver())
    }
}
extension SignUpviewModel {
    struct Input {
        let cancelTrigger: Driver<Void>
        let saveTrigger: Driver<Void>
        let email: Driver<String>
        let phone: Driver<String>
        let name: Driver<String>
        let pass: Driver<String>
        let rpass: Driver<String>
    }
    struct Output {
        let dismiss: Driver<Void>
        let saveEnabled: Driver<Bool>
        let saved: Driver<User>
        let error: Driver<Error>
    }
}
