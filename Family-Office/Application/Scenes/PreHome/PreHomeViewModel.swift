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

final class PreHomeViewModel: ViewModelType {
    private let user: User
    private let navigator: PreHomeNav
    init(user: User, navigator: PreHomeNav) {
        self.user = user
        self.navigator = navigator
    }
    func transform(input: PreHomeViewModel.Input) -> PreHomeViewModel.Output {
    
        let toCreateFamily  = input.createBtntrigger.do(onNext: navigator.toAddFamily)
        let user = Variable(self.user).asDriver().startWith(self.user)
        let fams = Variable(self.user.families).asDriver().map { (fams) -> [Family] in
            return fams
            }.startWith(self.user.families )
        let selectedFamily = input.selection
            .withLatestFrom(fams) { _, fams in return fams.first! }
            .do(onNext:{ _ in self.navigator.toHome()})
        return Output(user: user, families: fams, create: toCreateFamily, selectedFamily: selectedFamily)
    }
}
extension PreHomeViewModel {
    struct Input {
        let selection: Driver<IndexPath>
        let createBtntrigger: Driver<Void>
    }
    struct Output {
        let user: Driver<User>
        let families: Driver<[Family]>
        let create: Driver<Void>
        let selectedFamily: Driver<Family>
    }
}
