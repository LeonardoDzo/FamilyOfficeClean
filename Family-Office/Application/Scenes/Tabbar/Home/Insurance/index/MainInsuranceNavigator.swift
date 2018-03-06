//
//  MainInsuranceNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

final class InsuranceNavigator: NavigatorType {
    private let disposeBag = DisposeBag()
   
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func toMain(sender: Any? = nil) {
        let view = MainInsuranceViewController()
        view.viewModel = MainInsuranceViewModel(navigator: self)
        let result = NetUseCaseProvider()
            .makeInsuranceUseCase()
            .get()
            .asDriverOnErrorJustComplete()
        result.drive().disposed(by: disposeBag)
        
        navigationController?.pushViewController(view, animated: true)
    }
    func toDetails(type: INSURANCETYPE) -> Void {
        let navigator = DetailsInsuranceNavigator(navigationController: self.navigationController!)
        navigator.toMain(sender: type)
    }
}
