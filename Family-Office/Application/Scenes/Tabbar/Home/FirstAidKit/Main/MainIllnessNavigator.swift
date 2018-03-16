//
//  MainIllnessNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class MainIllnessNavigator: NavigatorType {
    private let disposeBag = DisposeBag()
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toMain(sender: Any? = nil) {
        let view = MainIllnessViewController()
        view.viewModel = MainIllnessViewModel(navigator: self, useCase: NetUseCaseProvider().makeIllnessUseCase())
        print("toMain Safebox")
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func toAddEdit(illness: Illness = Illness()) -> Void {
        let navigator = IllnessAddNavigator(nc: self.navigationController)
        navigator.toMain(sender: illness)
    }
}
