//
//  AgendaViewModel.swift
//  Family-Office
//
//  Created by Nan Montaño on 18/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

struct DayData {
    let item: EventInstance
    let showDate: Bool
}

class AgendaViewModel: ViewModelType {
    let useCase: EventsUseCase
    let navigator: AgendaNavigator
    
    init(useCase: EventsUseCase, navigator: AgendaNavigator) {
        self.useCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        
        let days: Driver<[DayData]> = Driver.combineLatest(input.start, input.end, resultSelector: { (start, end) in
            return (start, end)
        }).flatMapLatest{ (arg) in
            
            
            let (start, end) = arg
            var days = [Date]()
            return self.useCase.get(start: start, end: end)
                .map { items in
                    return items.flatMap{ $0.instances }.map { inst -> DayData in
                        var showDate = false
                        let day = Date(inst.start)!.startOfDay()
                        if days.index(of: day) == nil {
                            days.append(day)
                            showDate = true
                        }
                        return DayData(
                            item: inst,
                            showDate: showDate
                        )
                    }
                }.asDriverOnErrorJustComplete()
        }
        
        return Output(days: days)
    }
}

extension AgendaViewModel {
    struct Input {
        let start: Driver<Date>
        let end: Driver<Date>
    }
    struct Output {
        let days: Driver<[DayData]>
    }
}
