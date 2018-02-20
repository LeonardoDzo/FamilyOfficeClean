//
//  FamilyUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol FamilyUseCase {
    func save(fam: Family) -> Observable<Void>
    func get() -> Observable<[Family]>
    func get(byId: String) -> Observable<Family>
    //func delete(fam: Family) -> Observable<Void>
    // func allUser(fid: String) -> Void
    
}
