//
//  MenuMainNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol MenuMainNavigatorPr {
    func toMain()
}
class AssistantMainNavigator: MenuMainNavigatorPr {
    
    private let navigationController: UINavigationController
    private let service: NetUseCaseProvider
    init(service: NetUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain() {
        let view = AssistantViewController()
        navigationController.pushViewController(view, animated: true)
    }
}
