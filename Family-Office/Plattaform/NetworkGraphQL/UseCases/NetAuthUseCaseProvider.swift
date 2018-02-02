//
//  UseCaseProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public final class NetAuthUseCaseProvider : UseCaseProvider {
    private let networkProvider: NetworkProvider
    
    public init() {
        networkProvider = NetworkProvider()
    }
    
    public func makeAuthUseCase() -> AuthUseCase {
        return NetAuthUseCase(networkProvider.makeAuthNetwork())
    }
    
}

