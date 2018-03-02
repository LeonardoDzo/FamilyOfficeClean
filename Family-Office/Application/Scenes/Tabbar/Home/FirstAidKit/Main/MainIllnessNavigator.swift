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
    
    init(nc: UINavigationController) {
        self.navigationController = nc
        navigationController?.navigationBar.barTintColor = MODULE.FIRSTKIT.color()
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
       
    }
    func toMain(sender: Any? = nil) {
        let view = MainIllnessViewController()
        view.viewModel = MainIllnessViewModel(navigator: self, useCase: NetUseCaseProvider().makeIllnessUseCase())
        self.navigationController?.pushViewController(view, animated: true)
    }
    
    func toAddEdit(illness: Illness = Illness()) -> Void {
        let navigator = IllnessAddNavigator(nc: self.navigationController)
        navigator.toMain(sender: illness)
    }
}
