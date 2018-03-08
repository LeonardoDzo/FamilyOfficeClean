//
//  RMFamilyMembershioUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class RMFamilyMembershipUseCase<Repository>: FamilyMembershipUseCase where Repository: AbstractRepository, Repository.T == FamilyMembership {
    
    private let repository: Repository!
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save(fammem: FamilyMembership) -> Observable<Void> {
        return repository.save(entity: fammem)
    }
    
    func get(byUser uid: String) -> Observable<[FamilyMembership]> {
        let predicate = NSPredicate(format: "user.uid == %@", uid)
        return repository.query(with: predicate, sortDescriptors: [])
    }
    func get(byFamily fid: String) -> Observable<[FamilyMembership]> {
        let predicate = NSPredicate(format: "family.uid == %@", fid)
        return repository.query(with: predicate, sortDescriptors: [])
    }
}
