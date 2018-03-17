//
//  CreateEventNavigator.swift
//  Family-Office
//
//  Created by Nan Montaño on 16/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift

public class CreateEventNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    let provider = NetUseCaseProvider()
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any?) {
        let ctrl = CreateEventController()
        ctrl.viewModel = CreateEventViewModel(navigator: self, useCase: provider.makeEventsUseCase())
        navigationController?.pushViewController(ctrl, animated: true)
    }
    
}
