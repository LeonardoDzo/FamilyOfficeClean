//
//  Task.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class PendingViewModel: ViewModelType {
    private let usecases: PendingUseCase!
    private let assistantUseCase: UserUseCase!
    private let navigator: AssistantMainNavigator!
    init(usecases: PendingUseCase, userUseCase: UserUseCase, navigator: AssistantMainNavigator) {
        self.usecases = usecases
        self.navigator = navigator
        self.assistantUseCase = userUseCase
    }

    func transform(input: PendingViewModel.Input) -> PendingViewModel.Output {
        let errorTracker = ErrorTracker()

        let pendings = input.trigger.flatMapLatest {
            return self.usecases.get()
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        }.map({$0.filter({$0.assistantId == assistantId})})
        let assistants = input.trigger.flatMapLatest {
            return self.assistantUseCase
                .getAssistants()
                .asDriverOnErrorJustComplete()
            }.do(onNext:  {users in
                if users.isEmpty {
                    self.navigator.toAddAssistant()
                }
            })
        
        let back = input.backtrigger.do(onNext: self.navigator.toBack)
        
        return Output(pendings: pendings, assistants: assistants, backTrigger: back, modeEdit: input.editTrigger)
    }
}
extension PendingViewModel {
    struct Input {
        let trigger: Driver<Void>
        let editTrigger: Driver<Void>
        let backtrigger: Driver<Void>
        let gotoAddAssistant: Driver<Void>
    }
    struct Output {
        let pendings: Driver<[Pending]>
        let assistants: Driver<[User]>
        let backTrigger: Driver<Void>
        let modeEdit: Driver<Void>
    }
}
