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
            .withLatestFrom(input.recurrence, resultSelector: { ev, rec in (ev, rec)})
            .flatMapLatest { (ev, rec) in
                return self.useCase
                    .create(event: ev, recurrence: rec?.toString())
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
        let recurrence: Driver<rrule?>
        let submit: Driver<Void>
    }
    struct Output {
        let created: Driver<Event>
        let enabled: Driver<Bool>
    }
}
