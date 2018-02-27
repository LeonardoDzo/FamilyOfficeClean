//
//  ProfileAssitantNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

protocol NavigatorPr {
    func toMain()
    func toBack()
}
class ProfileAssistantNavigator: NavigatorPr {
    private let disposeBag = DisposeBag()
    private let navigationController: UINavigationController
    private let service: RMUseCaseProvider!
    init(service: RMUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain() {
        let view = ProfileAssistantViewController()
        
        view.viewModel = ProfileAsssistantViewModel(assistantUseCase: service.makeUseCase(), navigator: self)
        navigationController.pushViewController(view, animated: true)
    }
    
    func toBack() -> Void {
        navigationController.dismiss(animated: true, completion: nil)
    }
}

