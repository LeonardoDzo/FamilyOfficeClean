//
//  FamilyNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public final class FamilyNetwork {
    private let network: Network<Family>

    init(network: Network<Family>) {
        self.network = network
    }

    public func createFamily(family: Family) -> Observable<Family> {
        return network.postItem(CreateFamilyMutation(name: family.name))
    }
}
