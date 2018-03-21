//
//  UserinfoNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 18/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class UserInfoNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any?) {
        if let u = sender as? User {
            let view = UserPersonalFormViewController()
            view.user = Variable(u)
            view.viewModel = UserPersonalViewModel(userUseCase: NetUseCaseProvider().makeUseCase(), navigator: self)
            navigationController?.pushViewController(view, animated: true)
        }
    }
    
}
