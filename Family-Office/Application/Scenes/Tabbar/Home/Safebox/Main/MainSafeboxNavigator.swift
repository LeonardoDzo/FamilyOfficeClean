//
//  MainSafeboxNavigator.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

final class MainSafeboxNavigator: NavigatorType {
    private let disposeBag = DisposeBag()
    weak var navigationController: UINavigationController?
    var v = MainSafebox()
    
    init(nc: UINavigationController){
        self.navigationController = nc
    }
    
    func toMain(sender: Any? = nil) {
        let view = MainSafeboxViewController()
        view.viewModel = MainSafeboxViewModel(navigator: self, safeboxUseCase: NetUseCaseProvider().makeSafeboxUseCase())
        
        self.navigationController?.pushViewController(view, animated: true)
    }
}
