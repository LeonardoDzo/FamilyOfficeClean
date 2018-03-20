//
//  NetEventsUseCase.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetEventsUseCase: EventsUseCase {
    private let disposeBag = DisposeBag()
    private let provider: RMUseCaseProvider!
    private let network: EventsNetwork!
    
    init(network: EventsNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }

    func get(start: Date, end: Date) -> Observable<[Event]> {
        return network.get(start: start, end: end).map { evs in
            let events: [Event] = evs.map { ev in
                var event = ev
                event.instances = ev.instances.map { inst in
                    var instance = inst
                    instance.parent = ev
                    return instance
                }
                return event
            }
            return events
        }
    }

    func create(event: Event, recurrence: String? = nil) -> Observable<Event> {
        return network.create(event: event, recurrence: recurrence)
    }

}

