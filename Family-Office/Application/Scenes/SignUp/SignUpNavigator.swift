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
    func toPreHome(user: User) -> Void
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
    func toPreHome(user: User) {
        let preHome = PreHomeViewController()
        let nc = UINavigationController(rootViewController: preHome)
        let navigator = PreHomeNav(service: RMUserUseCaseProvider(), nc:  nc)
        let viewModel = PreHomeViewModel(user: user, navigator: navigator)
        preHome.viewModel = viewModel
       
        navigationController.present(nc, animated: true, completion: nil)
    }
    
}
