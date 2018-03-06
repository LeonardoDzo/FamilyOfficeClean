//
//  InsuranceNethwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class InsuranceNetwork {
    private let network: Network<Insurance>
    init(network: Network<Insurance>) {
        self.network = network
    }
    
    func get() -> Observable<[Insurance]> {
        return network.getItems(AllInsurancesQuery())
    }
}
