//
//  PreHomeNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import SideMenu
protocol PreHomeNavigator {
    func toHome()
    func toMe(user: User)
    func toSignIn()
    func toAddFamily()
    func toProfile()
}
class PreHomeNav: PreHomeNavigator {
    
    private let navigationController: UINavigationController
    private let service: NetUseCaseProvider
    init(service: NetUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMe(user: User) {
    }
    
    func toHome() {
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-booking"), selectedImage: nil)
    
        let homeNavigator = HomeNavigator(navigationController: homeNavigationController)
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [
            homeNavigationController
        ]
        let menu = MenuViewController()
        menu.viewModel = MenuViewModel(service: RMUseCaseProvider().makeFamilyUseCase())
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menu)
        menuLeftNavigationController.view.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        tabBarController.view.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        navigationController.present(tabBarController, animated: true, completion: nil)
        homeNavigator.toMain()
       
    }
    func toAddFamily() {
        let view = AddEditFamilyViewController()
        let nc = UINavigationController(rootViewController: view)
        let navigator = AddEditNavigator(nc: nc)
        view.viewModel = AddEditViewModel(navigator: navigator, familyUseCase: service.makeFamilyUseCase())
        navigationController.present(nc, animated: true, completion: nil)
    }
    func toSignIn() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    func toProfile() {
        let view = ProfileViewController()
        navigationController.pushViewController(view, animated: true)
    }
}
