//
//  PreHomeViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class PreHomeViewModel: ViewModelType {
    private let uid: String
    private let userUseCase: UserUseCase
    private let navigator: PreHomeNav
    init(uid: String, navigator: PreHomeNav, userusecase: UserUseCase) {
        self.uid = uid
        self.userUseCase = userusecase
        self.navigator = navigator
    }
    func transform(input: PreHomeViewModel.Input) -> PreHomeViewModel.Output {
    
        let toCreateFamily  = input.createBtntrigger.do(onNext: navigator.toAddFamily)
        let user = input.triggerUser.flatMapLatest {
            return self.userUseCase.getUser(by: self.uid).flatMapLatest({ (<#User?#>) -> ObservableConvertibleType in
                <#code#>
            })
        }
        return Output(user: u, create: toCreateFamily)
    }
}
extension PreHomeViewModel {
    struct Input {
        let triggerUser: Driver<Void>
        let createBtntrigger: Driver<Void>
    }
    struct Output {
        let user: Driver<User>
        let create: Driver<Void>
    }
}
