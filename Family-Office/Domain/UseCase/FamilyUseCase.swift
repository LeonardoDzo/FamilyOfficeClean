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
    func save(fam: Family) -> Observable<Family>
//    func delete(fam: Family) -> Observable<Void>
    // func allUser(fid: String) -> Void
    
}