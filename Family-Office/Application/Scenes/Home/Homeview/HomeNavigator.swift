//
//  HomeNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import SideMenu

protocol HomeNavigatorPr {
    func toMain() -> Void
    func toModule(homeBtn: HomeBtn)
}
class HomeNavigator: HomeNavigatorPr {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toMain() {
        let vc = HomeViewController()
        vc.viewModel = HomeViewmodel(navigator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    func toModule(homeBtn: HomeBtn) {
        let tabBarController = UITabBarController()
        tabBarController.view.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        
        let mainNavigationController = UINavigationController()
        mainNavigationController.navigationBar.barTintColor = homeBtn.color
        
        tabBarController.tabBar.tintColor = homeBtn.color
        switch homeBtn.module.hashValue {
        case MODULE.ASSISTANT.hashValue:
            
            mainNavigationController.tabBarItem = UITabBarItem(title: "Tareas", image: #imageLiteral(resourceName: "task_completed"), selectedImage: nil)
            let mainNavigator = AssistantMainNavigator(service: NetUseCaseProvider(), nc: mainNavigationController)
            
            let profileAssistant = UINavigationController(rootViewController: ProfileAssistantViewController())
            profileAssistant.tabBarItem = UITabBarItem(title: "Asistente", image: #imageLiteral(resourceName: "clipboard"), selectedImage: nil)
            profileAssistant.navigationBar.barTintColor = homeBtn.color
            
            tabBarController.viewControllers = [mainNavigationController, profileAssistant]
            navigationController.present(tabBarController, animated: true, completion: nil)
            
            mainNavigator.toMain()
            break
        default:
            break
        }
        
        
    }
}
