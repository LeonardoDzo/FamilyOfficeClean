//
//  FamilyUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class RMFamilyUseCase<Repository>: FamilyUseCase where Repository: AbstractRepository, Repository.T == Family {

    private let repository: Repository!

    init(repository: Repository) {
        self.repository = repository
    }

    func save(fam: Family) -> Observable<Void> {
        return repository.save(entity: fam)
    }
    func get() -> Observable<[Family]> {
        return repository.queryAll()
    }
    func get(byId: String) -> Observable<Family> {
        return repository.query(uid: byId)
    }

    func changeFamilyActive(family: Family) -> Observable<Void> {

        return Observable.create { observer in
                self.repository.queryAll().do(onNext: {fams in
                    fams.forEach({ f in
                        var fam = f
                        fam.isSelected = fam.uid == family.uid ? true : false
                        self.repository.save(entity: fam).subscribe().dispose()
                    })
                    observer.onNext(())
                    observer.onCompleted()
                }).subscribe().dispose()
            return Disposables.create()
        }
    }

    func getFamilyActive() -> Observable<Family> {
        return repository.queryAll().map({ (family)  in
            return family.filter({$0.isSelected}).first ??  family.first ?? Family(name: "No hay familia")
        })
    }
    
    func getMyFamilies(uid: String) -> Observable<[Family]> {
        let predicate = NSPredicate(format: "ANY members.user.uid == %@", uid)
        return repository.query(with: predicate, sortDescriptors: [])
        
    }
}
