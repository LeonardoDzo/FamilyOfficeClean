//
//  MainSafeboxViewModel.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

final class MainSafeboxViewModel: ViewModelType {
    let navigator: MainSafeboxNavigator!
    let safeboxUseCase: SafeboxUseCase
    
    init(navigator: MainSafeboxNavigator, safeboxUseCase: SafeboxUseCase){
        self.navigator = navigator
        self.safeboxUseCase = safeboxUseCase
    }
    
    func transform(input: MainSafeboxViewModel.Input) -> MainSafeboxViewModel.Output {
        let back = input.backTrigger.do(onNext: self.navigator.toDissmiss)
        let errorTracker = ErrorTracker()
        var result = [SafeboxAttachment]()
        let value = input.willAppearTrigger.flatMapLatest {_ in
            return self.safeboxUseCase
                .get(password: "123456")
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
            }.do(onNext: {result = $0})
        let tap = input.taptrigger.do(onNext: {
            switch $0.tag{
            case 3:
                //alert con opciones para crear, subir, importar
                break
            default:
                break
            }
        })
        
        let safeboxAttachments = Driver.combineLatest(value, tap, input.searchTrigger) {values, tap, search -> [SafeboxAttachment] in
            var value: [SafeboxAttachment]! = values
            switch tap.tag{
            case 1:
                value = values.filter({!$0.mime.contains("img")})
                break
            case 2:
                value = values.filter({$0.mime.contains("img")})
                break
            default:
                break
            }
            if (!(search?.isEmpty)!){
                value = value.filter({$0.name.lowercased().contains(search!.lowercased())})
            }
            return value
        }
        
        return Output(back: back, tap: tap.mapToVoid(), safeboxAttachments: value, error: errorTracker.asDriver())
    }
    
}

extension MainSafeboxViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let taptrigger: Driver<UITabBarItem>
        let willAppearTrigger: Driver<Void>
        let searchTrigger: Driver<String?>
    }
    
    struct Output {
        let back: Driver<Void>
        let tap: Driver<Void>
        let safeboxAttachments: Driver<[SafeboxAttachment]>
        let error: Driver<Error>
    }
}
