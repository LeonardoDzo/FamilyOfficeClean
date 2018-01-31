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
        return Output()
    }
}
extension PreHomeViewModel {
    struct Input {
    }
    struct Output {
        
    }
}
