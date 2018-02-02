//
//  UseCaseProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation



public protocol UseCaseProvider {
    func makeAuthUseCase() -> AuthUseCase
}
public protocol UserUseCaseProvider {
    func makeUseCase() -> UserUseCase
}
