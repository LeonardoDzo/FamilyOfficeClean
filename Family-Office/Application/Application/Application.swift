//
//  Application.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

final class Application {
    static let shared = Application()

    private let realmUseCaseProvider: RMUserUseCaseProvider
    private let networkUseCaseProvider: NetAuthUseCaseProvider
    
    private init() {
        self.realmUseCaseProvider = RMUserUseCaseProvider()
        self.networkUseCaseProvider = NetAuthUseCaseProvider()
    }
    
    func configureMainInterface(in window: UIWindow) {
        let sigInVc = SignInViewController()
        let nc = UINavigationController(rootViewController: sigInVc)
        let signInNavigator = DefaultAuthNavigator(service: networkUseCaseProvider, nc: nc)
        sigInVc.viewModel = SignInviewModel(useCase: self.networkUseCaseProvider.makeAuthUseCase(), navigator: signInNavigator)
        window.rootViewController = nc
    }
}
