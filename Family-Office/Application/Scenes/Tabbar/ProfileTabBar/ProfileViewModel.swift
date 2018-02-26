//
//  ProfileViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 16/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class ProfileViewModel: ViewModelType {

    let useCase: UserUseCase!
    let navigator: ProfileNavigator!
    let user: User!
    init(user: User, navigator: ProfileNavigator, userUseCase: UserUseCase) {
        self.navigator = navigator
        self.user = user
        self.useCase = userUseCase
    }
    func transform(input: ProfileViewModel.Input) -> ProfileViewModel.Output {
        let back = input.backTrigger.do(onNext: self.navigator.toBack).asDriver()
        let user = self.getUser(input.trigger, self.useCase, self.user.uid)
        return Output(back: back, user: user)
    }

}
extension ProfileViewModel {
    struct Input {
        let trigger: Driver<Void>
        let backTrigger: Driver<Void>
    }
    struct Output {
        let back: Driver<Void>
        let user: Driver<User>
    }
}
