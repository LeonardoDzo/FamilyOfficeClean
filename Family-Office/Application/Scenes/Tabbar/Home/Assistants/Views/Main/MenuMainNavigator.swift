//
//  MenuMainNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol MenuMainNavigatorPr {
    func toMain()
    func toAddEditPending(pending: Pending)
    func toAddAssistant()
}
class AssistantMainNavigator: MenuMainNavigatorPr {
    private let navigationController: UINavigationController
    private let service: SuperProvider!
    init(service: SuperProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain() {
        let view = AssistantViewController()
        view.viewModel = PendingViewModel(usecases: service.rmusecaseprovider.makePendingUseCase(), userUseCase: service.netusecaseprovider.makeUseCase(), navigator: self)
        NetUseCaseProvider().makePendingUseCase().get().subscribe().dispose()
        navigationController.pushViewController(view, animated: true)
    }
    func toAddEditPending(pending: Pending) {
        let view = AddEditPendingViewController()
        view.viewModel = AddEditPendingViewModel(usecases: service.netusecaseprovider.makePendingUseCase() )
        view.pending = Variable(pending)
        
        let nc = UINavigationController(rootViewController: view)
        navigationController.present(nc, animated: true, completion: nil)
        
    }
    func toBack() -> Void {
        navigationController.dismiss(animated: true, completion: nil)
    }
    func toAddAssistant() {
        let navigator = AddAssistantNavigator(service: service.netusecaseprovider, nc: self.navigationController)
        navigator.toMain()
    }
}
