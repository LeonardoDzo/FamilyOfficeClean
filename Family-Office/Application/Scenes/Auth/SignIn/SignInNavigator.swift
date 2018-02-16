//
//  SignInRouter.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol AuthNavigator {
    func toSignIn(_ presenter: Bool)
    func toSignUp()
    func toPreHome(user: User)
}

class DefaultAuthNavigator: AuthNavigator {
    private var navigationController: UINavigationController
    private let services: NetUseCaseProvider
    
    init(service: NetUseCaseProvider, nc: UINavigationController) {
        self.services = service
        self.navigationController = nc
    }
    func toPreHome(user: User) {
        let preHome = PreHomeViewController()
        let nc = UINavigationController(rootViewController: preHome)
        let navigator = PreHomeNav(service: RMUseCaseProvider(), nc:  nc)
        let viewModel = PreHomeViewModel(user: user, navigator: navigator, familyUseCase: RMUseCaseProvider().makeFamilyUseCase(), userUseCase: RMUseCaseProvider().makeUseCase())
        preHome.viewModel = viewModel
        navigationController.present(nc, animated: true, completion: nil)
    }
    func toSignIn(_ presnter: Bool = false) {
           let sigInVc = SignInViewController()
           sigInVc.viewModel = SignInviewModel(useCase: self.services.makeAuthUseCase(), navigator: self)
        if !presnter {
            self.navigationController.pushViewController(sigInVc, animated: true)
        }else{
            self.navigationController.present(sigInVc, animated: true, completion: nil)
            navigationController = UINavigationController(rootViewController: sigInVc)
        }
       
    }
    func toSignUp() {
        let signUp = SignUpViewController()
        let nc = UINavigationController(rootViewController: signUp)
        let viewModel = SignUpviewModel(useCase: services.makeAuthUseCase(), navigator: SignUpNavigator(service: services, nc: nc))
        signUp.viewModel = viewModel
        navigationController.present(nc, animated: true, completion: nil)
    }
    
}
