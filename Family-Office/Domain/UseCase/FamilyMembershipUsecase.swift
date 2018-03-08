//
//  FamilyMembershipUsecase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol FamilyMembershipUseCase {
    func save(fammem: FamilyMembership) -> Observable<Void>
    func get(byUser uid: String) -> Observable<[FamilyMembership]>
    func get(byFamily fid: String) -> Observable<[FamilyMembership]>
}
