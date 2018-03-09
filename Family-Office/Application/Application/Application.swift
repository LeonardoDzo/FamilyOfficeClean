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
    private let networkUseCaseProvider: NetUseCaseProvider

    private init() {
        self.networkUseCaseProvider = NetUseCaseProvider()
    }

    func configureMainInterface(in window: UIWindow) {
        let nc = UINavigationController()

        let signInNavigator = DefaultAuthNavigator(service: networkUseCaseProvider, nc: nc)
        //window.rootViewController = nc
        window.rootViewController = ChatViewController()
        signInNavigator.toSignIn()
    }
}
