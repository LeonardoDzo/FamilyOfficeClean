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
final class PreHomeViewModel: ViewModelType {
    private let user: User
    private let navigator: PreHomeNav
    private let familyUseCase: FamilyUseCase!
    
    init(user: User, navigator: PreHomeNav, familyUseCase: FamilyUseCase) {
        self.user = user
        
        self.navigator = navigator
        self.familyUseCase = familyUseCase
        
    }
    
    
    func transform(input: PreHomeViewModel.Input) -> PreHomeViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let toCreateFamily = input.createBtntrigger.do(onNext: navigator.toAddFamily)
        let user = Variable(self.user).asDriver().startWith(self.user)
        
    
        let families = getFamilies(input, activityIndicator, errorTracker)
        
        let gotoProfile = input.profileViewTrigger.do(onNext: {_ in
            self.navigator.toProfile()
        })
        let logout = input.logoutTrigger.do(onNext: {
            let realm = try! Realm()
            try! realm.write({
                realm.deleteAll()
            })
            self.navigator.toSignIn()
        })
        let selectedFamily = input.selection
            .withLatestFrom(families) { _, fams in return fams.first! }
            .do(onNext:{ _ in self.navigator.toHome()})
        return Output(user: user, families: families, create: toCreateFamily, profile: gotoProfile, logout: logout, selectedFamily: selectedFamily)
    }
    
    fileprivate func getFamilies(_ input: PreHomeViewModel.Input, _ activityIndicator: ActivityIndicator, _ errorTracker: ErrorTracker) -> SharedSequence<DriverSharingStrategy, [Family]> {
        return input.trigger.flatMapLatest { ()  in
            return self.familyUseCase.get()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        }
    }
}
extension PreHomeViewModel {
    struct Input {
        let profileViewTrigger: Driver<Void>
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
        let selectedFamily: Driver<Family>
    }
}
