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
    private let services: NetUseCaseProvider
    
    init(service: NetUseCaseProvider, nc: UINavigationController) {
        self.services = service
        self.navigationController = nc
    }

    func toSignIn() {
          navigationController.dismiss(animated: true)
    }
    func toPreHome(user: User) {
        let preHome = PreHomeViewController()
        let nc = UINavigationController(rootViewController: preHome)
        let navigator = PreHomeNav(service: NetUseCaseProvider(), nc:  nc)
        let viewModel = PreHomeViewModel(user: user, navigator: navigator, familyUseCase: RMUseCaseProvider().makeFamilyUseCase())
        preHome.viewModel = viewModel
       
        navigationController.present(nc, animated: true, completion: nil)
    }
    
}
