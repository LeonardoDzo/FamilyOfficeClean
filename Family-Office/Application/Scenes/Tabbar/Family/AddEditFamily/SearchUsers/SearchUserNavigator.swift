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
    func toMe() -> Void
    func toBack() -> Void
 }


class SearchUserNavigator:  SearchUserNavPr {
    let service: NetUseCaseProvider!
    let navigateController: UINavigationController!

    init(service: NetUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigateController = nc
    }
    
    func toMe() {
        let view = SearchUsersViewController()
        view.viewModel = SearchUserViewModel(userUseCase: service.makeUseCase(), navigator: self)
        navigateController.pushViewController(view, animated: true)
    }
    
    func toBack() {
        navigateController.popViewController(animated: true)
    }
    
    
}
