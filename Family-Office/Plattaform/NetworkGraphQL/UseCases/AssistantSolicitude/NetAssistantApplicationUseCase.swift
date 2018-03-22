//
//  NetAssistantApplicationUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetApplicationAssistantUseCase: ApplicationAssistantUseCase {
    
    private let provider: RMUseCaseProvider!
    
    private let network: ApplicationAssistantNetwork!
    init( network: ApplicationAssistantNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
 
    func save(appAssistant: ApplicationAssistant) -> Observable<Void> {
        return network.createAssitantApplication(appAssistant.assistant.uid).do(onNext:  { solicitude in
            //self.provider.makeApplicationAssistantUseCase().save(appAssistant: solicitude).subscribe().dispose()
        }).mapToVoid()
    }
    func getAssistantsApplications() -> Observable<[ApplicationAssistant]> {
        return network.getApplications().do(onNext: { applications in
//            applications.forEach({self.provider.makeApplicationAssistantUseCase().save(appAssistant: $0).subscribe().dispose()})
        })
    }
}
