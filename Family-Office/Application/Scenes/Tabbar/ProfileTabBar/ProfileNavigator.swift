//
//  ProfileNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 16/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

class ProfileNavigator {
    private let service: RMUseCaseProvider!
    private let nc: UINavigationController!
    init(nc: UINavigationController, service: RMUseCaseProvider = RMUseCaseProvider()) {
        self.service = service
        self.nc = nc
    }

    func toBack() {
        nc.dismiss(animated: true, completion: nil)
    }
    func toProfile(user: User) {
        let view = ProfileViewController()
        view.viewModel = ProfileViewModel(user: user, navigator: self, userUseCase: service.makeUseCase())
        nc.pushViewController(view, animated: true)
    }
}
