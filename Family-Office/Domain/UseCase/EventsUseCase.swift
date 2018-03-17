//
//  EventsUseCase.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol EventsUseCase {
    func get(start: Date, end: Date) -> Observable<[Event]>
    func create(event: Event, recurrence: String?) -> Observable<Event>
}
