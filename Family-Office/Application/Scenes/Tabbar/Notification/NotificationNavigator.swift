//
//  NotificationNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol NotNavigator {
    func toMain()
}
class NotificationNavigator: NotNavigator {
    let service: RMUseCaseProvider!
    let navigationController: UINavigationController!
    init(navigationController: UINavigationController, service: RMUseCaseProvider = RMUseCaseProvider()) {
        self.service = service
        self.navigationController = navigationController
    }
    func toMain() {
        let notView = NotificationViewController()
        navigationController.pushViewController(notView, animated: true)
    }
}
