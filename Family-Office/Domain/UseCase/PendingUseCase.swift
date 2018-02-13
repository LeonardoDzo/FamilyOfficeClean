//
//  PendingUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol PendingUseCase {
    func save(pending: Pending) -> Observable<Void>
    func delete(pending: Pending) -> Observable<Void>
    func get() -> Observable<[Pending]>
}
