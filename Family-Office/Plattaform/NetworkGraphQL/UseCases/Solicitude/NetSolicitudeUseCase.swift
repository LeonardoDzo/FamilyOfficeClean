//
//  NetSolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
final class NetSolicitudeUseCase: SolicitudeUseCase {

    private let provider: RMUseCaseProvider!
    private let network: SolicitudeNetwork!
    init(network: SolicitudeNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    
    
    func save(solicitude: Solicitude) -> Observable<Void> {
        return network.createFamilyApplication(solicitude).do(onNext: { solicitude in
            self.provider.makeSolicitudeUseCase().save(solicitude: solicitude).subscribe().dispose()
        }).mapToVoid()
    }
    
    func getFamilyApplications() -> Observable<[Solicitude]> {
        return network.allFamilyApplications()
    }
    

}
