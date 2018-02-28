//
//  ApplicationSolicitudeViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 27/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class ApplicationFamilyViewwModel : ViewModelType {

    let useCase : ApplicationUseCase!
    init(useCase: ApplicationUseCase) {
        self.useCase = useCase
    }
    func transform(input: ApplicationFamilyViewwModel.Input) -> ApplicationFamilyViewwModel.Output {
        let accepted = input.accept.flatMapLatest { args in
            return self.useCase
                .approve(application: args.1)
                .asDriverOnErrorJustComplete()
        }
        return Output(accepted: accepted)
    }
}
extension ApplicationFamilyViewwModel {
    struct Input {
        let accept: Driver<(Void, ApplicationFamily)>
    }
    
    struct Output {
        let accepted: Driver<Void>
    }
}
