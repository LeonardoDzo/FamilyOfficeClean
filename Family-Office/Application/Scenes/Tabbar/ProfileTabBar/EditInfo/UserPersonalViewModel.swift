//
//  UserPersonalViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 18/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class UserPersonalViewModel: ViewModelType {
    
    let userUseCase: UserUseCase!
    let navigator: UserInfoNavigator!
    
    init(userUseCase: UserUseCase, navigator: UserInfoNavigator) {
        self.userUseCase = userUseCase
        self.navigator = navigator
    }
    func transform(input: UserPersonalViewModel.Input) -> UserPersonalViewModel.Output {
        let errorTracker = ErrorTracker()
        
        let canSave = input.user.map({ (user) -> Bool in
               return user.phone.length == 10 && user.name.length >= 4
        })
        
        let saved = input.tapSave.withLatestFrom(input.user) { _, u in
            return self.userUseCase
                .edit(user: u, photo: nil)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
            }.flatMapLatest({$0}).do(onNext: {self.navigator.toPop()})
    
        return Output(saved: saved, canSave: canSave, error: errorTracker.asDriver())
    }
}
extension UserPersonalViewModel {
    struct Input {
        let user: Driver<User>
        let tapSave: Driver<(Void)>
    }
    struct Output {
        let saved: Driver<Void>
        let canSave: Driver<Bool>
        let error: Driver<Error>
    }
}
