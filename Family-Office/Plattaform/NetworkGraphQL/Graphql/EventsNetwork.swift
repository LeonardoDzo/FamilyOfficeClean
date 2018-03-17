//
//  EventsNetwork.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class EventsNetwork {
    private let network: Network<Event>
    init(network: Network<Event>) {
        self.network = network
    }
    
    func get(start: Date, end: Date) -> Observable<[Event]> {
        return network.getItems(MyEventsQuery(
            start: start.toMillis(),
            end: end.toMillis()
        ))
    }
    
    func create(event: Event, recurrence: String? = nil) -> Observable<Event> {
        let instance = event.instances[0]
        return network.postItem(CreateEventMutation(
            start: instance.start,
            end: instance.end, summary: event.summary,
            description: event.description,
            recurrence: recurrence,
            location: instance.location,
            all_day: instance.allDay
        ))
    }
}
