//
//  AddAssistantNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol AssistantNavigatorPr {
    func toMain()
    func toBack()
}
class AddAssistantNavigator: AssistantNavigatorPr {

    private let navigationController: UINavigationController
    private let service: NetUseCaseProvider!
    init(service: NetUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain() {
        let view = AddAssistantViewController()
        navigationController.pushViewController(view, animated: true)
    }
    
    func toBack() -> Void {
        navigationController.dismiss(animated: true, completion: nil)
    }
}
