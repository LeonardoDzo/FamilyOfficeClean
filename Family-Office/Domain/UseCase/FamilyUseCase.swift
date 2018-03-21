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
    func edit(family: Family, photo: Data?) -> Observable<Void>
    func get() -> Observable<[Family]>
    func getMyFamilies(uid: String) -> Observable<[Family]>
    func get(byId: String) -> Observable<Family>
    func changeFamilyActive(family: Family) -> Observable<Void>
    func getFamilyActive() -> Observable<Family>
    //func delete(fam: Family) -> Observable<Void>
    // func allUser(fid: String) -> Void

}
