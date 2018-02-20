//
//  MenuViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift

final class MenuViewModel: ViewModelType {
    private var familyUseCase: FamilyUseCase!
    private var navigator: MenuNavigator!
    init(service: FamilyUseCase, navigator: MenuNavigator = MenuNavigator()) {
        self.familyUseCase = service
        self.navigator = navigator
    }
    
    func transform(input: MenuViewModel.Input) -> MenuViewModel.Output {
       
        let families = self.getFamilies(input.trigger, self.familyUseCase)
        let logout = input.triggerLogout.do(onNext: navigator.logout)
        return Output(families: families, logout: logout)
    }
    
   
}
extension MenuViewModel {
    struct Input {
        let trigger: Driver<Void>
        let triggerLogout: Driver<Void>
    }
    struct Output {
        let families: Driver<[Family]>
        let logout: Driver<Void>
    }
}