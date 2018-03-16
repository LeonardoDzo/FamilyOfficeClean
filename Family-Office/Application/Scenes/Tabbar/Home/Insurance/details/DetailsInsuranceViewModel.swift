//
//  DetailsInsuranceViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

final class DetailsInsurancesViewModel: ViewModelType {
    let navigator: DetailsInsuranceNavigator!
    let insuranceUseCase: InsuranceUseCase!
    let type: INSURANCETYPE!
    var insurances = [Insurance]()
    init(navigator: DetailsInsuranceNavigator, useCase: InsuranceUseCase, type: INSURANCETYPE) {
        self.navigator = navigator
        self.insuranceUseCase = useCase
        self.type = type
    }
    func transform(input: DetailsInsurancesViewModel.Input) -> DetailsInsurancesViewModel.Output {
        let insurances = input.trigger.flatMapLatest {
            return self.insuranceUseCase
                .get()
                .map({$0.filter({$0.type == self.type})})
                .asDriverOnErrorJustComplete()
            }.do(onNext: {self.insurances = $0})
        
        let selected = input.selectedTrigger.do(onNext: { indexPath in
            let url = self.insurances[indexPath.row].attachment?.routes.first
            self.navigator.toWebView(url: url)
        }).mapToVoid()
        
        return Output(insurances: insurances.asDriver(), selected: selected)
    }
}
extension DetailsInsurancesViewModel {
    struct Input {
        let trigger: Driver<Void>
        let selectedTrigger: Driver<IndexPath>
        
    }
    struct Output {
        let insurances: Driver<[Insurance]>
        let selected: Driver<Void>
    }
}
