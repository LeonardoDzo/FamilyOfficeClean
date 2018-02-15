//
//  ViewModelType.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
extension ViewModelType {
    
    func getFamilies(_ input: Driver<Void>,_ familyUseCase: FamilyUseCase) -> SharedSequence<DriverSharingStrategy, [Family]> {
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        return input.flatMapLatest({ _ -> Driver<[Family]> in
            return familyUseCase.get()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        })
    }
}
