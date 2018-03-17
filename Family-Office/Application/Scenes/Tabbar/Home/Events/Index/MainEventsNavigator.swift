//
//  MainEventsNavigator.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit

class MainEventsNavigator: NavigatorType {
    
    weak var navigationController: UINavigationController?
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any? = nil) {
        let ctrl = MainEventsViewController()
        ctrl.viewModel = MainEventsViewModel(eventsUseCase: NetUseCaseProvider().makeEventsUseCase(), navigator: self)
        navigationController?.pushViewController(ctrl, animated: true)
    }
    
    func toCreateEvent() {
        let nav = CreateEventNavigator(navigationController: navigationController!)
        nav.toMain(sender: nil)
    }
    
}
