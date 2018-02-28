//
//  NotificationNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

protocol NotNavigator {
    func toMain()
}
class NotificationNavigator: NotNavigator {
    private let disposeBag = DisposeBag()
    let service: RMUseCaseProvider!
    let navigationController: UINavigationController!
    init(navigationController: UINavigationController, service: RMUseCaseProvider = RMUseCaseProvider()) {
        self.service = service
        self.navigationController = navigationController
    }
    func toMain() {
        let notView = NotificationViewController()
        let result = NetUseCaseProvider().makeApplicationUseCase()
            .getFamilyApplications()
            .asDriverOnErrorJustComplete()
        result.drive().disposed(by: disposeBag)
        notView.viewModel = NotificationViewModel(applicationUseCase: NetUseCaseProvider().makeApplicationUseCase())
        navigationController.pushViewController(notView, animated: true)
    }
}
