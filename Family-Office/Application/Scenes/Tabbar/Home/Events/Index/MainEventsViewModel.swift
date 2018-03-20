//
//  MainEventsViewModel.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class MainEventsViewModel: ViewModelType {
    let disposeBag = DisposeBag()
    let useCase: EventsUseCase
    let navigator: MainEventsNavigator
    var events: [MonthData]?
    var year = 2018
    
    init(eventsUseCase: EventsUseCase, navigator: MainEventsNavigator) {
        self.useCase = eventsUseCase
        self.navigator = navigator
    }
    
    func transform(input: Input) -> Output {
        let tracker = ErrorTracker()
        let events = input.willAppear.flatMapLatest {_ -> Driver<[MonthData]> in
            let start = Date(year: self.year)
            let end = start.add(years: 1)
            return self.useCase
                .get(start: start, end: end)
                .trackError(tracker)
                .map { evs in
                    let allInstances = evs.flatMap { $0.instances }
                    var data = [MonthData]()
                    for m in 0..<12 {
                        data.append(MonthData(items: allInstances, month: start.add(months: m)))
                    }
                    print(data)
                    return data
                }.asDriverOnErrorJustComplete()
        }.do(onNext: {events in self.events = events })
        
        tracker.drive(onNext: {
            print($0)
        }).disposed(by: disposeBag)
        
        let tap = input.newEvent.do(onNext: {
            self.navigator.toCreateEvent()
        })
        
        let selected = input.itemSelected.do(onNext: { index in
            self.navigator.toAgenda()
        })
        
        return Output(
            months: events,
            tapped: tap,
            select: selected
        )
    }
}

extension MainEventsViewModel {
    struct Input {
        let willAppear: Driver<Void>
        let newEvent: Driver<Void>
        let itemSelected: Driver<IndexPath>
    }
    struct Output {
        let months: Driver<[MonthData]>
        let tapped: Driver<Void>
        let select: Driver<IndexPath>
    }
}
