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

final class SignUpviewModel: ViewModelType {
 
    private let authUseCase : AuthUseCase
    private let navigator: SignUpNavigator
    
    init(useCase: AuthUseCase, navigator: SignUpNavigator) {
        self.authUseCase = useCase
        self.navigator = navigator
    }
    func transform(input: SignUpviewModel.Input) -> SignUpviewModel.Output {
        let cancel = input.cancelTrigger.asDriver().do(onNext: navigator.toSignIn)
        return Output(dismiss: cancel)
    }
}
extension SignUpviewModel {
    struct Input {
        let cancelTrigger: Driver<Void>
    }
    struct Output {
        let dismiss: Driver<Void>
    }
}
