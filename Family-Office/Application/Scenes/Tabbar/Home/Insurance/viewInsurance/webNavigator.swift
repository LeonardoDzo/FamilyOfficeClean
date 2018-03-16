//
//  webNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

final class webNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any?) {
        let view = webViewController()
        if let str = sender as? String, let url = URL(string: str) {
            view.viewModel = webViewViewModel(navigator: self, url: url)
            navigationController?.pushViewController(view, animated: true)
        }
    }
}
