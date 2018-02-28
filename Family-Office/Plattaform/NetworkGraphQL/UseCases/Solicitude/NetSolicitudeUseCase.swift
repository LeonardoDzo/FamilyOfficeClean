//
//  NetSolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
final class NetApplicationUseCase: ApplicationUseCase {
    
    private let provider: RMUseCaseProvider!
    private let network: ApplicationsNetwork!
    init(network: ApplicationsNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }

    func save(solicitude: ApplicationFamily) -> Observable<Void> {
        return network.createFamilyApplication(solicitude).do(onNext: { solicitude in
            self.provider.makeApplicationUseCase().save(solicitude: solicitude).subscribe().dispose()
        }).mapToVoid()
    }
    
    func getFamilyApplications() -> Observable<[ApplicationFamily]> {
        return network.allFamilyApplications().do(onNext: { (applications) in
            applications.filter({!$0.uid.isEmpty}).forEach({ (af) in
                 self.provider.makeApplicationUseCase().save(solicitude: af).subscribe().dispose()
            })
           
        })
    }
    func approve(application: ApplicationFamily) -> Observable<Void> {
        return network.approve(aid: application.uid).do(onNext: { app in
            self.provider.makeApplicationUseCase().approve(application: app).subscribe().dispose()
        }).mapToVoid()
    }

}
