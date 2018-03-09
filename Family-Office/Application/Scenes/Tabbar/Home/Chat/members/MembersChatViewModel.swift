//
//  MembersChatViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MembersChatViewModel: ViewModelType {
    let navigator: MembersChatNavigator!
    
    let userUseCase: UserUseCase!
    init(navigator: MembersChatNavigator, userUseCase: UserUseCase) {
        self.userUseCase = userUseCase
        self.navigator = navigator
    }
    func transform(input: MembersChatViewModel.Input) -> MembersChatViewModel.Output {
        let error = ErrorTracker()
        let uid = UserDefaults().value(forKey: "uid") as? String ?? ""
        let users = input.appearTrigger.flatMapLatest {_ in
            return self.userUseCase.getUsers(phones: [], rol: 0)
                .map({$0.filter({$0.uid != uid})})
                .trackError(error)
                .asDriverOnErrorJustComplete()
        }
        return Output(users: users)
    }
}
extension MembersChatViewModel {
    struct Input {
        let appearTrigger: Driver<Void>
    }
    struct Output {
        let users: Driver<[User]>
    }
}
