//
//  SolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol SolicitudeUseCase {
     func save(solicitude: Solicitude) -> Observable<Void>
     func getFamilyApplications() -> Observable<[Solicitude]>
     //func getAssistantsApplications() -> Observable<[Solicitude]>
}
