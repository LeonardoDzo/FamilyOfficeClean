//
//  CreateEventViewModel.swift
//  Family-Office
//
//  Created by Nan Montaño on 16/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public class CreateEventViewModel: ViewModelType {
    
    let navigator: CreateEventNavigator!
    let useCase: EventsUseCase!
    init(navigator: CreateEventNavigator, useCase: EventsUseCase) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    func transform(input: Input) -> Output {
        let created = input.submit
            .withLatestFrom(input.event)
            .flatMapLatest { [unowned self] in
                return self.useCase
                    .create(event: $0, recurrence: nil)
                    .asDriverOnErrorJustComplete()
            }.do(onNext: { _ in
                self.navigator.toPop()
            })
        return Output(created: created, enabled: input.valid)
    }
}

extension CreateEventViewModel {
    struct Input {
        let valid: Driver<Bool>
        let event: Driver<Event>
        let submit: Driver<Void>
    }
    struct Output {
        let created: Driver<Event>
        let enabled: Driver<Bool>
    }
}
