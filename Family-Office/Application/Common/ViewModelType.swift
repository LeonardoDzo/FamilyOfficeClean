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

    func getFamilies(_ input: Driver<Void>, _ familyUseCase: FamilyUseCase) -> SharedSequence<DriverSharingStrategy, [Family]> {
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        return input.flatMapLatest({ _ -> Driver<[Family]> in
            return familyUseCase.get()
                .trackActivity(activityIndicator)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        })
    }

    func getFamily(_ input: Driver<Void>, _ familyUseCase: FamilyUseCase, _ id: String) -> SharedSequence<DriverSharingStrategy, Family> {
        let errorTracker = ErrorTracker()
        return input.flatMapLatest({ _ -> Driver<Family> in
            return familyUseCase.get(byId: id)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        })
    }

    func getUser(_ input: Driver<Void>, _ userUseCase: UserUseCase, _ uid: String) -> Driver<User> {
         let errorTracker = ErrorTracker()
         return input.flatMapLatest ({_ in
            return userUseCase.getUser(by: uid)
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
        })
    }

    func selectFamily(_ input: Driver<IndexPath>, _ families: [Family], _ familyUseCase: FamilyUseCase) -> Driver<Void> {
        return Driver.merge(input).flatMapLatest({ indexpath -> SharedSequence<DriverSharingStrategy, Void> in
            let result = families.enumerated().map({ (arg) -> SharedSequence<DriverSharingStrategy, Void> in
                var (i, fam) = arg
                fam.isSelected = i == indexpath.row ? true : false
                return familyUseCase.save(fam: fam).asDriverOnErrorJustComplete()
            })
            return Driver.merge(result)
        })
    }
}
