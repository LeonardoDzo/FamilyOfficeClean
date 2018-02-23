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
    let familyUseCase: FamilyUseCase!
    let userUseCase: UserUseCase!
    let navigator: FamProfileNavigator!

    init(familyUseCase: FamilyUseCase, navigator: FamProfileNavigator, userUseCase: UserUseCase) {
        self.familyUseCase = familyUseCase
        self.navigator = navigator
        self.userUseCase = userUseCase
    }
    func transform(input: FamilyProfileViewModel.Input) -> FamilyProfileViewModel.Output {
        let back = input.backtrigger.do(onNext: {self.navigator.toBack()})
        let family = input.familyTrigger.flatMapLatest({_ in
            return self.familyUseCase.getFamilyActive().asDriverOnErrorJustComplete()
        })
        let tapAdd = input.tapAddMemberTrigger.do(onNext: {self.navigator.addMember()})
        let members = family.flatMapLatest { (family) in
            return self.userUseCase.getUsers(byFamily: family).asDriverOnErrorJustComplete()
        }
    
        return Output(family: family, tapAddMember: tapAdd, back: back, members: members)
    }
    
}
extension FamilyProfileViewModel {
    struct Input {
        let familyTrigger: Driver<Void>
        let tapAddMemberTrigger: Driver<Void>
        let backtrigger: Driver<Void>
    }
    struct Output {
        let family: Driver<Family>
        let tapAddMember: Driver<Void>
        let back: Driver<Void>
        let members: Driver<[User]>
    }
}
