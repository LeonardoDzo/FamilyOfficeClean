//
//  AddEditFamilyViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class AddEditViewModel: ViewModelType {
    private let navigator: AddEditNavigator
    init( navigator: AddEditNavigator) {
        self.navigator = navigator
    }
    func transform(input: AddEditViewModel.Input) -> AddEditViewModel.Output {
        let back = input.backTrigger.do(onNext: navigator.toPrehome)
        let canSave = input.name.map { (value) -> Bool in
            return !(!value.isEmpty && value.count >= 6)
        }
        return Output(back: back, canSave: canSave)
    }
}
extension AddEditViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let name: Driver<String>
    }
    struct Output {
        let back: Driver<Void>
        let canSave: Driver<Bool>
    }
}
