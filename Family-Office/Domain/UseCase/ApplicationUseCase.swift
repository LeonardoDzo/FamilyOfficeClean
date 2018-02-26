//
//  SolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol ApplicationFamilyUseCase {
     func save(solicitude: ApplicationFamily) -> Observable<Void>
     func getFamilyApplications() -> Observable<[ApplicationFamily]>
     //func getAssistantsApplications() -> Observable<[Solicitude]>
}
