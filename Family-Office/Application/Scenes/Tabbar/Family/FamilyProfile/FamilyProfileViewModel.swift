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
    
    var family: Family!
    
    init(familyUseCase: FamilyUseCase, navigator: FamProfileNavigator, userUseCase: UserUseCase) {
        self.familyUseCase = familyUseCase
        self.navigator = navigator
        self.userUseCase = userUseCase
    }
    
    func transform(input: FamilyProfileViewModel.Input) -> FamilyProfileViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let back = input.backtrigger.do(onNext: {self.navigator.toBack()})
        let f = input.familyTrigger.flatMapLatest({_ in
            return self.familyUseCase
                .getFamilyActive()
                .trackActivity(activityIndicator)
                .asDriverOnErrorJustComplete()
        }).do(onNext: {self.family = $0})
        let tapAdd = input.tapAddMemberTrigger.do(onNext: {self.navigator.addMember(family: self.family)})
        let members = f.flatMapLatest { (family) in
            return self.getMembers(family: family)
        }
        let selected = input.changeImage.withLatestFrom(f).map({$0})
        return Output(family: f, tapAddMember: tapAdd, back: back, members: members, selected: selected)
    }

}
extension FamilyProfileViewModel {
    struct Input {
        let familyTrigger: Driver<Void>
        let tapAddMemberTrigger: Driver<Void>
        let backtrigger: Driver<Void>
        let changeImage: Driver<Void>
    }
    struct Output {
        let family: Driver<Family>
        let tapAddMember: Driver<Void>
        let back: Driver<Void>
        let members: Driver<[User]>
        let selected: Driver<Family>
        
    }
}
