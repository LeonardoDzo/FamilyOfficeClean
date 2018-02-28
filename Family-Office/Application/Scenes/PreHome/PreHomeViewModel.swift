//
//  PreHomeViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift
import RxRealm

final class PreHomeViewModel: ViewModelType {
    private let user: User
    private let navigator: PreHomeNav
    private var families = [Family]()
    private let userUseCase: UserUseCase!
    private let familyUseCase: FamilyUseCase!

    init(user: User, navigator: PreHomeNav, familyUseCase: FamilyUseCase, userUseCase: UserUseCase) {
        self.user = user
        self.userUseCase = userUseCase
        self.navigator = navigator
        self.familyUseCase = familyUseCase
    }



    fileprivate func SelectFamily(_ input: PreHomeViewModel.Input, _ families: SharedSequence<DriverSharingStrategy, [Family]>) -> SharedSequence<DriverSharingStrategy, Family> {
        return input.selection
            .withLatestFrom(families) { _, fams in return fams.first! }
            .do(onNext: { _ in self.navigator.toHome()})
    }

    func transform(input: PreHomeViewModel.Input) -> PreHomeViewModel.Output {
        let toCreateFamily = input.createBtntrigger.do(onNext: navigator.toAddFamily)

        let user = self.getUser(input.trigger, self.userUseCase, self.user.uid)

        let families = input.trigger.flatMapLatest {
            return self.getMyFamilies(self.familyUseCase)
            }.do(onNext: {self.families = $0})
    
        let gotoProfile = input.profileViewTrigger.do(onNext: {_ in
            self.navigator.toProfile(user: self.user)
        })

        let logout = input.logoutTrigger.do(onNext: {
            self.logout()
            self.navigator.toSignIn()
        })

        let selectedFamily = input.selection.flatMapLatest { (indexpath) in
            return self.familyUseCase
                .changeFamilyActive(family: self.families[indexpath.row])
                .asDriverOnErrorJustComplete()
        }.do(onNext: {self.navigator.toHome()})

        return Output(user: user, families: families, create: toCreateFamily, profile: gotoProfile, logout: logout, selectedFamily: selectedFamily)
    }

}
extension PreHomeViewModel {
    struct Input {
        let profileViewTrigger: Driver<Void>
        let triggerUser: Driver<Void>
        let logoutTrigger: Driver<Void>
        let trigger: Driver<Void>
        let selection: Driver<IndexPath>
        let createBtntrigger: Driver<Void>
    }
    struct Output {
        let user: Driver<User>
        let families: Driver<[Family]>
        let create: Driver<Void>
        let profile: Driver<Void>
        let logout: Driver<Void>
        let selectedFamily: Driver<Void>
    }
}
