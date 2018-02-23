//
//  SolicitudeUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol SolocitudeUseCase {
     func save(solicitude: Solicitude) -> Observable<Void>
     func get(familyId: String) -> Observable<[Solicitude]>
     func get(assistant: String) -> Observable<[Solicitude]>
}
