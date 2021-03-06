//
//  FamilyNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol FamProfileNavPr {
    func toMain()
    func addMember(family: Family)
}

final class FamProfileNavigator: FamProfileNavPr {
    private let nc: UINavigationController!
    private let service: RMUseCaseProvider!
    init(nc: UINavigationController, service: RMUseCaseProvider = RMUseCaseProvider()) {
        self.nc = nc
        self.service = service
    }

    func toMain() {
        let view = FamilyProfileViewController()
        view.viewModel = FamilyProfileViewModel( familyUseCase: service.makeFamilyUseCase(), navigator: self, userUseCase: service.makeUseCase())
        nc.pushViewController(view, animated: true)
    }
    func toBack() {
        nc.dismiss(animated: true, completion: nil)
    }
    func addMember(family: Family) {
        let navigator = SearchUserNavigator(service: NetUseCaseProvider(), rmService: service, nc: nc)
        navigator.toMe(family: family)
    }
}
