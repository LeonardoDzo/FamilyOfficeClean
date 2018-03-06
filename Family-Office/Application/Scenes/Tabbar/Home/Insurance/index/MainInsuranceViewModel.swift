//
//  MainInsuranceViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

final class MainInsuranceViewModel: ViewModelType {
    let navigator: InsuranceNavigator!
    let insures: [INSURANCETYPE] = [.cars, .homes, .lifes, .med]
    init(navigator: InsuranceNavigator) {
        self.navigator = navigator
    }
    func transform(input: MainInsuranceViewModel.Input) -> MainInsuranceViewModel.Output {
        let select = input.selectTrigger.do(onNext:  { indexpath in
            self.navigator.toDetails(type: self.insures[indexpath.item])
        })
        return Output(insurances: BehaviorRelay(value: insures).asDriver(), selected: select.mapToVoid())
    }
}
extension MainInsuranceViewModel {
    struct Input {
        let selectTrigger: Driver<IndexPath>
    }
    struct Output {
        let insurances: Driver<[INSURANCETYPE]>
        let selected: Driver<Void>
    }
}
