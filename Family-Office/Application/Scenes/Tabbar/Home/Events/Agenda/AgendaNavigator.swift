//
//  AgendaNavigator.swift
//  Family-Office
//
//  Created by Nan Montaño on 18/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit

class AgendaNavigator: NavigatorType {
    var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any?) {
        let ctrl = AgendaController()
        ctrl.viewModel = AgendaViewModel(
            useCase: NetUseCaseProvider().makeEventsUseCase(),
            navigator: self
        )
        navigationController?.pushViewController(ctrl, animated: true)
    }
    
    
}
