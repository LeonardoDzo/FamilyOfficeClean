//
//  webViewViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class webViewViewModel: ViewModelType {
    let navigator: webNavigator!
    let url: URL!
    
    init(navigator: webNavigator, url: URL) {
        self.navigator = navigator
        self.url = url
    }
    
    func transform(input: webViewViewModel.Input) -> webViewViewModel.Output {
        let urltrigger = input.trigger.flatMapLatest({ _ in
            return BehaviorRelay(value: self.url).asDriver()
        })
    
    
        return Output(triggerURl: urltrigger, estimateUrl: input.estimateTrigger)
    }
}
extension webViewViewModel {
    struct Input {
        let trigger: Driver<Void>
        let estimateTrigger: Driver<Double>
    }
    struct Output {
        let triggerURl: Driver<URL?>
        let estimateUrl: Driver<Double>
    }
}
