//
//  NetSolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
final class NetApplicationFamilyUseCase: ApplicationFamilyUseCase {

    private let provider: RMUseCaseProvider!
    private let network: ApplicationFamilyNetwork!
    init(network: ApplicationFamilyNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }

    func save(solicitude: ApplicationFamily) -> Observable<Void> {
        return network.createFamilyApplication(solicitude).do(onNext: { solicitude in
            self.provider.makeApplicationFamilyUseCase().save(solicitude: solicitude).subscribe().dispose()
        }).mapToVoid()
    }

    func getFamilyApplications() -> Observable<[ApplicationFamily]> {
        return network.allFamilyApplications()
    }

}
