//
//  MenuViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift

final class MenuViewModel: ViewModelType {
    private var familyUseCase: FamilyUseCase!
    init(service: FamilyUseCase) {
        self.familyUseCase = service
    }
    
    func transform(input: MenuViewModel.Input) -> MenuViewModel.Output {
        let activityIndicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        let families = getFamilies(input, activityIndicator, errorTracker)
        
        return Output(families: families)
    }
    
    fileprivate func getFamilies(_ input: MenuViewModel.Input, _ activityIndicator: ActivityIndicator, _ errorTracker: ErrorTracker) -> SharedSequence<DriverSharingStrategy, [Family]> {
       
        return input.trigger.flatMapLatest { _ in
            return self.familyUseCase.get()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        }
    }
}
extension MenuViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
        let families: Driver<[Family]>
    }
}
