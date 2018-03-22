//
//  AddEditAssistantViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class AddEditPendingViewModel: ViewModelType {
    private let usecases: PendingUseCase!
    init(usecases: PendingUseCase) {
       self.usecases = usecases
    }

    func transform(input: AddEditPendingViewModel.Input) -> AddEditPendingViewModel.Output {
        let errorTracker = ErrorTracker()

        let save = input.saveTrigger.withLatestFrom(input.canSaveTrigger).flatMapLatest { [unowned self] in
            return self.usecases.save(pending: $0)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
            }.do(onNext: { _ in

            })
        let cansave = input.canSaveTrigger.map { ( pending) -> Bool in
            return !pending.assistantId.isEmpty && !pending.title.isEmpty && pending.title.count > 4 
        }
        return Output(canSave: cansave, save: save)
    }
}
extension AddEditPendingViewModel {
    struct Input {
        let canSaveTrigger: Driver<Pending>
        let saveTrigger: Driver<Void>
    }
    struct Output {
        let canSave: Driver<Bool>
        let save: Driver<Void>
    }
}
