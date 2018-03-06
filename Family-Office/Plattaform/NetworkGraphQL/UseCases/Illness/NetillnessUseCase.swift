//
//  illnessUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetIllnessUseCase: IllnessUseCase {
    
    
    private let provider: RMUseCaseProvider!
    private let network: IllnessNetwork!
    
    init( network: IllnessNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()) {
        self.network = network
        self.provider = provider
    }
    
    func save(illness: Illness) -> Observable<Void> {
        return provider.makeFamilyUseCase().getFamilyActive().flatMapLatest { (fam) -> Observable<Void> in
             var illness = illness
             illness.family = fam
            let uid = UserDefaults().value(forKey: "uid") as? String
            illness.creator = User(uid:  uid ?? "" , name: "", email: "")
            return self.network.createIllness(illness).mapToVoid()
        }
    }
    
    func edit(illness: Illness) -> Observable<Void> {
        return network.updateIllness(illness).mapToVoid()
    }
    
    func delete(illness: Illness) -> Observable<Void> {
        return network.delete(illness).mapToVoid()
    }
    
    func get() -> Observable<[Illness]> {
        return provider.makeFamilyUseCase().getFamilyActive().flatMapLatest {
            return self.network.get(fid: $0.uid)
        }
    }
    
}
