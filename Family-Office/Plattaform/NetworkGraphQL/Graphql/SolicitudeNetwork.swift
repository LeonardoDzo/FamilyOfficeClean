//
//  SolicitudeNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public final class SolicitudeNetwork {
    private let network: Network<Solicitude>
    
    init(network: Network<Solicitude>) {
        self.network = network
    }
    
    func createFamilyApplication(_ solicitude: Solicitude) -> Observable<Solicitude> {
        return network.postItem(FamilyApplicationMutation(userId: solicitude.to, familyId: solicitude.from))
    }
    func allFamilyApplications() -> Observable<[Solicitude]>{
        return network.getItems(FamilyApplicationsQuery())
    }
   
}
