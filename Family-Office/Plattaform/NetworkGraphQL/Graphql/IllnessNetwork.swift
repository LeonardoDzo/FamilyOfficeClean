//
//  IllnessNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class IllnessNetwork {
    private let network: Network<Illness>
    
    init(network: Network<Illness>) {
        self.network = network
    }
    func createIllness(_ illness: Illness) -> Observable<Illness> {
        return network.postItem(CreateIllnessMutation(name: illness.name, description: illness.details, medicines: illness.medicines, type: illness.type.rawValue, user: illness.creator.uid, family: illness.family.uid))
    }
    func updateIllness(_ illness: Illness) -> Observable<Illness> {
        return network.postItem(EditIllnessMutation(id: illness.uid,name: illness.name, description: illness.details, medicines: illness.medicines, type: illness.type.rawValue))
    }
    func delete(_ illness: Illness) -> Observable<Illness> {
        return network.postItem(DeleteIllnessMutation(id: illness.uid))
    }
    func get(fid: String!) -> Observable<[Illness]> {
        return network.getItems(AllIllnessQuery(fid: fid))
    }
    
}
