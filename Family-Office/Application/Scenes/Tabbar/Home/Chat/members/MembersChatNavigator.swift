//
//  MembersChatNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class MembersChatNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    let service: RMUseCaseProvider!
    init(nc: UINavigationController, service: RMUseCaseProvider = RMUseCaseProvider()) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain(sender: Any?) {
        let view = MembersTableViewController()
        view.viewModel = MembersChatViewModel(navigator: self, userUseCase: service.makeUseCase())
        navigationController?.pushViewController(view, animated: true)
    }
}
