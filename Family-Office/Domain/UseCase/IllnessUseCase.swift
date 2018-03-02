//
//  IllnessUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol IllnessUseCase {
    func save(illness: Illness) -> Observable<Void>
    func edit(illness: Illness) -> Observable<Void>
    func delete(illness: Illness) -> Observable<Void>
    func get() -> Observable<[Illness]>
}
