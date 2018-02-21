//
//  FamilyViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class FamilyProfileViewModel: ViewModelType {
    let family: Family!
    let familyUseCase: FamilyUseCase!
    let navigator: FamProfileNavigator!
    init(family: Family, familyUseCase: FamilyUseCase, navigator: FamProfileNavigator) {
        self.family = family
        self.familyUseCase = familyUseCase
        self.navigator = navigator
    }
    func transform(input: FamilyProfileViewModel.Input) -> FamilyProfileViewModel.Output {
        let back = input.backtrigger.do(onNext: {self.navigator.toBack()})
        let family = self.getFamily(input.familyTrigger, self.familyUseCase, self.family.uid)
        let members = family.flatMapLatest { (family) in
            return BehaviorRelay(value: family.members).asDriver()
        }
        
        return Output(family: family, back: back, members: members)
    }
    
}
extension FamilyProfileViewModel {
    struct Input {
        let familyTrigger: Driver<Void>
        let backtrigger: Driver<Void>
    }
    struct Output {
        let family: Driver<Family>
        let back: Driver<Void>
        let members: Driver<[User]>
    }
}
