//
//  InsuranceUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol InsuranceUseCase {
    func get() -> Observable<[Insurance]>
    func save(insurance: Insurance) -> Observable<Void>
}
