//
//  SignUpNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol SignUpNavigatorProtocol {
    func toSignIn() -> Void
}
class SignUpNavigator: SignUpNavigatorProtocol {
    private let navigationController: UINavigationController
    private let services: NetAuthUseCaseProvider
    
    init(service: NetAuthUseCaseProvider, nc: UINavigationController) {
        self.services = service
        self.navigationController = nc
    }

    func toSignIn() {
          navigationController.dismiss(animated: true)
    }
    
}
