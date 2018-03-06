//
//  IllnessAddNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class IllnessAddNavigator: NavigatorType {
    
    var navigationController: UINavigationController?
    init(nc: UINavigationController?) {
        self.navigationController = nc
    }
    
    func toMain(sender: Any?) {
        let view = IllnessViewController()
        if let model = sender as? Illness {
            view.model = Variable(model)
        }
        
        view.viewModel = IllnessAddViewModel(navigator: self, useCase: NetUseCaseProvider().makeIllnessUseCase())
        navigationController?.pushViewController(view, animated: true)
    }
    
}
