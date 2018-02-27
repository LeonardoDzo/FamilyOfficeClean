//
//  ProfileAssistantViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ProfileAsssistantViewModel : ViewModelType {
    
    let assistantUseCase: UserUseCase!
    let navigator: ProfileAssistantNavigator!
    
    
    init(assistantUseCase: UserUseCase, navigator: ProfileAssistantNavigator) {
        self.assistantUseCase = assistantUseCase
        self.navigator = navigator
    }
    func transform(input: ProfileAsssistantViewModel.Input) -> ProfileAsssistantViewModel.Output {
        let assistants = input.trigger.flatMapLatest { _ in
            return self.assistantUseCase
                .getAssistants()
                .asDriverOnErrorJustComplete()
            .map({$0.first ?? User(name: "", email: "", phone: "")})
            }
        return Output(assistant: assistants)
    }
}
extension ProfileAsssistantViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
        let assistant: Driver<User>
    }
}
