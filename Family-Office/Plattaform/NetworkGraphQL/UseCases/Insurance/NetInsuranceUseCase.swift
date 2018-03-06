//
//  InsuranceUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetInsuranceUseCase: InsuranceUseCase {
    private let provider: RMUseCaseProvider!
    private let network: InsuranceNetwork!
    
    init( network: InsuranceNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    func get() -> Observable<[Insurance]> {
        return network.get().do(onNext: { insurances in
            insurances.forEach({self.provider.makeInsuranceUseCase().save(insurance: $0).subscribe().dispose()})
        })
    }
    func save(insurance: Insurance) -> Observable<Void> {
        return Variable(()).asObservable()
    }
}

