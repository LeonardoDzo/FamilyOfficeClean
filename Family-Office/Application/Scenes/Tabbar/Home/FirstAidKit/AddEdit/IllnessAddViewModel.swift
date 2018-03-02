//
//  IllnessAddViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
final class IllnessAddViewModel: ViewModelType {
    let illnessUseCase: IllnessUseCase!
    let navigator: IllnessAddNavigator!
    
    init(navigator: IllnessAddNavigator, useCase: IllnessUseCase) {
        self.illnessUseCase = useCase
        self.navigator = navigator
    }
    func transform(input: IllnessAddViewModel.Input) -> IllnessAddViewModel.Output {
        let error = ErrorTracker()
        let flag = input.illnessTrigger.map {
            return !$0.details.isEmpty && !$0.medicines.isEmpty && !$0.name.isEmpty
        }.asDriver()
        
        let save = Driver.combineLatest(input.illnessTrigger, input.saveTrigger).flatMapLatest { illness, _ -> Driver<Void> in
            if illness.uid.isEmpty {
                return self.illnessUseCase.save(illness: illness)
                    .trackError(error)
                    .asDriverOnErrorJustComplete()
            }
            return self.illnessUseCase.edit(illness: illness)
                        .trackError(error)
                        .asDriverOnErrorJustComplete()
           
            }.do(onNext: { _ in self.navigator.toPop()})
        
        return Output(isEnabled: flag, saved: save, error: error.asDriver())
    }
}
extension IllnessAddViewModel {
    struct Input {
        let illnessTrigger: Driver<Illness>
        let saveTrigger: Driver<Void>
    }
    struct Output {
        let isEnabled: Driver<Bool>
        let saved: Driver<Void>
        let error: Driver<Error>
    }
}
