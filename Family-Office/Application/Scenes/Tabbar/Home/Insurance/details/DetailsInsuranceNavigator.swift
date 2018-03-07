//
//  DetailsInsuranceNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

final class DetailsInsuranceNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any?) {
        let view = DetailsInsuranceViewController()
        if let type = sender as? INSURANCETYPE {
            view.viewModel = DetailsInsurancesViewModel(navigator: self, useCase: RMUseCaseProvider().makeInsuranceUseCase(), type: type)
            navigationController?.pushViewController(view, animated: true)
        }
    }
    func toWebView(url: String?) -> Void {
        let navigator = webNavigator(navigationController: navigationController!)
        navigator.toMain(sender: url)
    }
}
