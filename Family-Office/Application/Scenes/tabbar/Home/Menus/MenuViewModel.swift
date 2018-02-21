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
    private var families = [Family]()
    init(service: FamilyUseCase, navigator: MenuNavigator = MenuNavigator()) {
        self.familyUseCase = service
        self.navigator = navigator
    }
    
    func transform(input: MenuViewModel.Input) -> MenuViewModel.Output {
       
        let families = self.getFamilies(input.trigger, self.familyUseCase).do(onNext: {(families) in
            self.families = families
        })
        let logout = input.triggerLogout.do(onNext: navigator.logout)
        let selected = Driver.merge(input.triggerSelected).flatMapLatest({ indexpath -> SharedSequence<DriverSharingStrategy, Void> in
            let result = self.families.enumerated().map({ (arg) -> SharedSequence<DriverSharingStrategy, Void> in
                var (i, fam) = arg
                fam.isSelected = i == indexpath.row ? true : false
                return self.familyUseCase.save(fam: fam).asDriverOnErrorJustComplete()
            })
            return Driver.merge(result).asDriver().mapToVoid()
        })
        
        
        
        return Output(families: families, selected: selected, logout: logout)
    }
    
   
}
extension MenuViewModel {
    struct Input {
        let trigger: Driver<Void>
        let triggerSelected: Driver<IndexPath>
        let triggerLogout: Driver<Void>
    }
    struct Output {
        let families: Driver<[Family]>
        let selected: Driver<Void>
        let logout: Driver<Void>
    }
}
