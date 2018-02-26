//
//  NetPendingUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetPendingUseCase: PendingUseCase {

    private let provider: RMUseCaseProvider!
    private let network: PendingNetwork!
    init(network: PendingNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    func save(pending: Pending) -> Observable<Void> {
        return network.create(pending: pending).do(onNext: { pending in
            _ = self.provider.makePendingUseCase().save(pending: pending).subscribe().dispose()
        }).mapToVoid()
    }

    func delete(pending: Pending) -> Observable<Void> {
        return network.delete(pending: pending)
    }

    func get() -> Observable<[Pending]> {
        return network.get().do(onNext: { pendings in
            pendings.forEach({ (pending) in
                _ = self.provider.makePendingUseCase().save(pending: pending).subscribe().dispose()
            })

        })
    }
}
