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
    private let navigator: AssistantMainNavigator!
    init(usecases: PendingUseCase, navigator: AssistantMainNavigator) {
        self.usecases = usecases
        self.navigator = navigator
    }

    func transform(input: PendingViewModel.Input) -> PendingViewModel.Output {
        let errorTracker = ErrorTracker()

        let pendings = input.trigger.flatMapLatest {
            return self.usecases.get()
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        }

        let back = input.backtrigger.do(onNext: self.navigator.toBack)
        return Output(pendings: pendings, backTrigger: back, modeEdit: input.editTrigger)
    }
}
extension PendingViewModel {
    struct Input {
        let trigger: Driver<Void>
        let editTrigger: Driver<Void>
        let backtrigger: Driver<Void>
    }
    struct Output {
        let pendings: Driver<[Pending]>
        let backTrigger: Driver<Void>
        let modeEdit: Driver<Void>
    }
}
