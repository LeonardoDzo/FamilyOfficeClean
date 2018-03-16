//
//  NetSafeboxUseCase.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class NetSafeboxUseCase: SafeboxUseCase {
    private let provider: RMUseCaseProvider!
    private let network: SafeboxNetwork!
    
    init(network: SafeboxNetwork, provider: RMUseCaseProvider = RMUseCaseProvider()){
        self.network = network
        self.provider = provider
    }
    
    func get(password: String) -> Observable<[SafeboxAttachment]> {
        return self.network.get(pwd: password)
    }
}
