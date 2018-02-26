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
import Hero

protocol PreHomeNavigator {
    func toHome()
    func toMe(user: User)
    func toSignIn()
    func toAddFamily()
    func toProfile(user: User)
}
class PreHomeNav: PreHomeNavigator {

    private let navigationController: UINavigationController
    private let service: RMUseCaseProvider
    init(service: RMUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
        navigationController.hero.isEnabled = true
    }

    func toMe(user: User) {
          let preHome = PreHomeViewController()
            let viewModel = PreHomeViewModel(user: user, navigator: self, familyUseCase: service.makeFamilyUseCase(), userUseCase: service.makeUseCase())
            preHome.viewModel = viewModel
            preHome.hero.isEnabled = true
            navigationController.hero.navigationAnimationType = .slide(direction: .up)
            navigationController.pushViewController(preHome, animated: true)
    }

    fileprivate func setMenu() {
        let menu = MenuViewController()
        menu.viewModel = MenuViewModel(service: service.makeFamilyUseCase())

        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: menu)
        menuLeftNavigationController.view.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuBlurEffectStyle = UIBlurEffectStyle.extraLight
        SideMenuManager.default.menuAnimationFadeStrength = 0.4
        SideMenuManager.default.menuAnimationTransformScaleFactor = 1
        SideMenuManager.default.menuWidth =  240
    }

    func toHome() {
        let homeNavigationController = UINavigationController()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "icons8-booking"), selectedImage: nil)
        homeNavigationController.navigationBar.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let homeNavigator = HomeNavigator(navigationController: homeNavigationController)

        let familyNc = UINavigationController()
        familyNc.view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let familiesnavigator = FamProfileNavigator(nc: familyNc)
        familyNc.tabBarItem = UITabBarItem(title: "Mi Familia", image: #imageLiteral(resourceName: "Family"), selectedImage: nil)

        let notificationNc = UINavigationController()
        notificationNc.tabBarItem = UITabBarItem(title: "Notificationes", image: #imageLiteral(resourceName: "icons8-megaphone"), selectedImage: nil)
        let notificationNavigator = NotificationNavigator(navigationController: notificationNc)

        let tabBarController = UITabBarController()
        tabBarController.title = "Menu"
        tabBarController.viewControllers = [
            homeNavigationController,
            familyNc,
            notificationNc
        ]

        tabBarController.tabBar.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

        setMenu()

        tabBarController.view.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        navigationController.present(tabBarController, animated: true, completion: nil)
        homeNavigator.toMain()
        familiesnavigator.toMain()
        notificationNavigator.toMain()
    }
    func toAddFamily() {
        let nc = UINavigationController()
        let navigator = AddEditNavigator(nc: nc)
        navigationController.present(nc, animated: true, completion: nil)
        navigator.toMe()
    }
    func toSignIn() {
        navigationController.dismiss(animated: true, completion: nil)
    }

    func toProfile(user: User) {
        let nc = UINavigationController()
        let navigator = ProfileNavigator(nc: nc)
        navigator.toProfile(user: user)
        navigationController.present(nc, animated: true, completion: nil)

    }
}
