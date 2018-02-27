//
//  UseCaseProvider.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public protocol AuthUseCaseProvider {
    func makeAuthUseCase() -> AuthUseCase
}
public protocol UseCaseProvider {
    func makeUseCase() -> UserUseCase
    func makeFamilyUseCase() -> FamilyUseCase
    func makePendingUseCase() -> PendingUseCase
    func makeApplicationUseCase() -> ApplicationUseCase
    func makeApplicationAssistantUseCase() -> ApplicationAssistantUseCase
 }
