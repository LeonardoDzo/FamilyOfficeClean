//
//  SolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol ApplicationUseCase {
     func save(solicitude: ApplicationFamily) -> Observable<Void>
     func getFamilyApplications() -> Observable<[ApplicationFamily]>
     func approve(application: ApplicationFamily) -> Observable<Void>
}

public protocol ApplicationAssistantUseCase {
    func save(appAssistant: ApplicationAssistant) -> Observable<Void>
    func getAssistantsApplications() -> Observable<[ApplicationAssistant]>
}
