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
    func toHome()
}
class DefaultHomeNavigator: HomeNavigatorPr {
    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toHome() {
        let vc = HomeViewController()
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: vc)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        navigationController.pushViewController(vc, animated: true)
    }
}
