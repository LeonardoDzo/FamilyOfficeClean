//
//  AddEditPendingNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol AddEditPendingNavigatorPr {
    func toMain(pending: Pending)
    func toHome()
}
class AddeditPendingNavigator: AddEditPendingNavigatorPr {
    private let navigationController: UINavigationController
    private let service: SuperProvider!
    init(service: SuperProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain(pending: Pending) {
        let view = AddEditPendingViewController()
        view.viewModel = AddEditPendingViewModel(usecases: service.netusecaseprovider.makePendingUseCase() )
        view.pending = Variable(pending)
        navigationController.pushViewController(view, animated: true)
    }
    func toHome() {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
