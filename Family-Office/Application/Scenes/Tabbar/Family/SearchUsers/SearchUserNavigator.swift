//
//  SearchUserNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol SearchUserNavPr {
    func toMe(family: Family)
    func toBack()
 }

class SearchUserNavigator: SearchUserNavPr {
    let service: NetUseCaseProvider!
    let navigateController: UINavigationController!
    let rmService: RMUseCaseProvider!
    init(service: NetUseCaseProvider, rmService: RMUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigateController = nc
        self.rmService = rmService
    }

    func toMe(family: Family) {
        let view = SearchUsersViewController()
        view.viewModel = SearchUserViewModel(userUseCase: service.makeUseCase(), navigator: self, rmsolicitude: rmService.makeApplicationUseCase())
        view.viewModel.famiy = family
        navigateController.pushViewController(view, animated: true)
    }

    func toBack() {
        navigateController.popViewController(animated: true)
    }

}
