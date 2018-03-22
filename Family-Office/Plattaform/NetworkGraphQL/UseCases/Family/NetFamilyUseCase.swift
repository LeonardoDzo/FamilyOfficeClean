//
//  File.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

final class NetFamilyUseCase: FamilyUseCase {
    private let diposeBag = DisposeBag()
    private let network: FamilyNetwork!
    private let provider: RMUseCaseProvider!
    init(_ network: FamilyNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    func save(fam: Family) -> Observable<Void> {
        return network.createFamily(family: fam).do(onNext: { family in
            MainSocket.shareIntstance.channel.action("execute", with: FamilySubscription(fam))
            self.provider.makeFamilyUseCase().save(fam: family).subscribe().dispose()
        }).mapToVoid()
    }
    func get() -> Observable<[Family]> {
        return Variable([]).asObservable()
    }
    func get(byId: String) -> Observable<Family> {
        return Variable(Family(name: "Cargando...")).asObservable()
    }

    func changeFamilyActive(family: Family) -> Observable<Void> {
        return Variable(()).asObservable()
    }
    func getFamilyActive() -> Observable<Family> {
        return Variable(Family(name: "")).asObservable()
    }
    func getMyFamilies(uid: String = "") -> Observable<[Family]> {
        return network.myFamilies().do(onNext: {fams in
            let realm = try! Realm()
            /// Elimina chat que ya no contiene
            realm.objects(RMFamily.self).forEach({ (family) in
                if !fams.contains(where: {$0.uid == family.uid}) {
                    try! realm.write {
                        realm.delete(family)
                    }
                }
            })
            fams.forEach({
                $0.members.forEach({MainSocket.shareIntstance.channel.action("execute", with: UserSubscription($0.user))})
                self.provider.makeFamilyUseCase().save(fam: $0).subscribe().disposed(by: self.diposeBag)
            })
        })
    }
    
    func edit(family: Family, photo: Data?) -> Observable<Void> {
        return network.edit(family: family, photo: photo).mapToVoid()
    }
}
