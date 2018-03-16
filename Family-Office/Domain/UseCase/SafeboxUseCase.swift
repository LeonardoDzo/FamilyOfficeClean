//
//  SafeboxUseCase.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol SafeboxUseCase {
    func get(password: String) -> Observable<[SafeboxAttachment]>
}
