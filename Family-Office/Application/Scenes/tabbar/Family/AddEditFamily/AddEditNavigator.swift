//
//  AddEditNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol AddEditNavigatorPr {
    func toback()
    func toMe() -> Void
}

class AddEditNavigator: AddEditNavigatorPr{
    private let navigationController: UINavigationController
    private let service : NetUseCaseProvider!
    init( nc: UINavigationController, service: NetUseCaseProvider = NetUseCaseProvider()) {
        self.navigationController = nc
        self.service = service
    }
    
    func toback() {
         navigationController.dismiss(animated: true)
    }
    func toMe() {
        let view = AddEditFamilyViewController()
        view.viewModel = AddEditViewModel(navigator: self, familyUseCase: self.service.makeFamilyUseCase())
        navigationController.pushViewController(view, animated: true)
    }
}
