//
//  PendingNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public final class PendingNetwork {
    private let network: Network<Pending>

    init(network: Network<Pending>) {
        self.network = network
    }

    public func create(pending: Pending) -> Observable<Pending> {
        return network.postItem(CreatePendingMutation(title: pending.title, priority: pending.priority.value, details: pending.details, assistant: pending.assistantId))
    }
    public func delete(pending: Pending) -> Observable<Void> {
        return Variable(()).asObservable()
    }
    public func get() -> Observable<[Pending]> {
        return network.getItems(AllPendingQuery())
    }
}
