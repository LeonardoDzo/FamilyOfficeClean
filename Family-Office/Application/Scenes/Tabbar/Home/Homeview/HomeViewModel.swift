//
//  HomeViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class HomeViewmodel: ViewModelType {
    var navigator: HomeNavigator!
    init(navigator: HomeNavigator) {
        self.navigator = navigator
    }
    func transform(input: HomeViewmodel.Input) -> HomeViewmodel.Output {
        let homeBtns = Variable(HomeBtn.btns).asDriver().startWith(HomeBtn.btns)
        
        let selectBtn = input.selectTrigger.withLatestFrom(homeBtns) { indexpath, homebtns -> HomeBtn in
            return homebtns[indexpath.row]
        }.do(onNext: navigator.toModule)
        let menu = input.menuTrigger.asDriver()

        return Output(homeBtns: homeBtns, selected: selectBtn, menu: menu)
    }
}

extension HomeViewmodel {
    struct Input {
        let menuTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    struct Output {
        let homeBtns: Driver<[HomeBtn]>
        let selected: Driver<HomeBtn>
        let menu: Driver<Void>
    }
}
