//
//  HomeFamilyNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol HomeFamilyPr {
    func familyProfile()
    func addfamily()
}

final class HomeFamilyNavigator: HomeFamilyPr {
    var navigationController: UINavigationController!
    var netService: NetUseCaseProvider!
    var rmService: RMUseCaseProvider!
    init(nc: UINavigationController, netprovider: NetUseCaseProvider = NetUseCaseProvider(), rmprovider: RMUseCaseProvider = RMUseCaseProvider()) {
        navigationController = nc
        self.rmService = rmprovider
        self.netService = netprovider
    }
    func fmailies() {
        let view = FamilyViewController()
        view.viewModel = FamilyViewModel(familyUseCase: rmService.makeFamilyUseCase(), navigator: self)
        navigationController.pushViewController(view, animated: true)
    }

    func familyProfile() {
        let nc = UINavigationController()
        nc.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nc.isNavigationBarHidden = true
        let navigator = FamProfileNavigator(nc: nc)
        navigationController.present(nc, animated: true, completion: nil)
        navigator.toMain()
    }
    func addfamily() {
        let view = AddEditFamilyViewController()
        let nc = UINavigationController(rootViewController: view)
        let navigator = AddEditNavigator(nc: nc)
        view.viewModel = AddEditViewModel(navigator: navigator, familyUseCase: netService.makeFamilyUseCase())
        navigationController.present(nc, animated: true, completion: nil)
    }
}
