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
    private let familyUseCase: FamilyUseCase
    init( navigator: AddEditNavigator, familyUseCase: FamilyUseCase) {
        self.navigator = navigator
        self.familyUseCase = familyUseCase
    }
    func transform(input: AddEditViewModel.Input) -> AddEditViewModel.Output {
        let back = input.backTrigger.do(onNext: navigator.toPrehome)
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let canSave = input.name.map { (value) -> Bool in
            return !(!value.isEmpty && value.count >= 6)
        }
        let save = input.saveTrigger.withLatestFrom(input.name)
            .map { (name) -> Family in
                return Family(name: name)
            }.flatMapLatest { [unowned self] in
                return self.familyUseCase.save(fam: $0)
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
            }.do(onNext:{ _ in
                self.navigator.toPrehome()
            })
        
        return Output(back: back, canSave: canSave, saved: save, error: errorTracker.asDriver())
    }
}
extension AddEditViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let saveTrigger: Driver<Void>
        let name: Driver<String>
    }
    struct Output {
        let back: Driver<Void>
        let canSave: Driver<Bool>
        let saved: Driver<Void>
        let error: Driver<Error>
    }
}
