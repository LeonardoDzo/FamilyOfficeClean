//
//  HomeCellViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class HomeCellViewmodel: ViewModelType {
    var navigator: HomeNavigator!
    init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    func transform(input: HomeCellViewmodel.Input) -> HomeCellViewmodel.Output {
        let selected = input.selectTrigger
            .map({ (btn, _ ) -> HomeBtn in
                return btn
            })
            .do(onNext: navigator.toModule)
            .mapToVoid()

        return Output(selected: selected)
    }
}

extension HomeCellViewmodel {
    struct Input {
        let selectTrigger: Driver<(HomeBtn, Void)>
    }
    struct Output {
        let selected: Driver<Void>
    }
}
