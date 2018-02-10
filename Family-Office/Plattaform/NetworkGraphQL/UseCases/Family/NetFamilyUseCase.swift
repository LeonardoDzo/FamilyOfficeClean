//
//  File.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetFamilyUseCase: FamilyUseCase  {
    private let network: FamilyNetwork!
    private let provider: RMUseCaseProvider!
    init(_ network: FamilyNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    func save(fam: Family) -> Observable<Void> {
        return network.createFamily(family: fam).do(onNext: { family in
        _ = self.provider.makeFamilyUseCase().save(fam: family).subscribe().dispose()
        }).mapToVoid()
    }
    func get() -> Observable<[Family]> {
        return Variable([]).asObservable()
    }
}
