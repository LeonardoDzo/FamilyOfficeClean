//
//  UserRowsViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 20/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class UsersRowsViewModel: ViewModelType {
    func transform(input: UsersRowsViewModel.Input) -> UsersRowsViewModel.Output {
        let users = input.trigger.flatMapLatest {
            return RMUseCaseProvider()
                .makeUseCase()
                .getUsers(phones: [], rol: 0).map({$0.filter({$0.uid != me})})
                .asDriverOnErrorJustComplete()
        }
        return Output(users: users)
    }
}
extension UsersRowsViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
        let users: Driver<[User]>
    }
}
