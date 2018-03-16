//
//  SafeboxNetwork.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class SafeboxNetwork{
    private let network: Network<SafeboxAttachment>
    
    init(network: Network<SafeboxAttachment>){
        self.network = network
    }
    
    func get(pwd: String!) -> Observable<[SafeboxAttachment]> {
        return network.getItems(MySafeboxFilesQuery(password: pwd))
    }
}
