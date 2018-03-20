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
    var bc:[String] = []
    
    init(navigator: MainSafeboxNavigator, safeboxUseCase: SafeboxUseCase){
        self.navigator = navigator
        self.safeboxUseCase = safeboxUseCase
    }
    
    func transform(input: MainSafeboxViewModel.Input) -> MainSafeboxViewModel.Output {
        let back = input.backTrigger.do(onNext: self.navigator.toDissmiss)
        let errorTracker = ErrorTracker()
        var result = [SafeboxAttachment]()
        var value = input.willAppearTrigger.flatMapLatest {_ in
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
        
        let select = input.selectTrigger.do(onNext: { indexpath in
            
            let selectedItem = result[indexpath.row]
            let folder = selectedItem.name.split(separator: "/")[0]
            self.bc.append(String(describing: folder))
            var currentPath: String = ""
            if self.bc.count == 1{
                currentPath = "\(self.bc.last!)/"
            }else{
                currentPath = self.bc.joined(separator: "/")
            }
            if let range = selectedItem.name.range(of: currentPath) {
                let rest = selectedItem.name[range.upperBound...]
                print(currentPath)
                print(rest)
                print(selectedItem.name)
                print(self.bc)
            }
//            print("SELECCIONE ESTE ARCHIVO: \(selectedItem.name)")
        })
        
        let safeboxAttachments = Driver.combineLatest(value, tap, input.searchTrigger) {values, tap, search -> [SafeboxAttachment] in
//            print(select)
            
            var array: [SafeboxAttachment]! = values
            switch tap.tag{
            case 1:
                array = values.filter({!$0.mime.contains("image")})
                break
            case 2:
                array = values.filter({$0.mime.contains("image")})
                break
            default:
                break
            }
            if (!(search?.isEmpty)!){
                array = array.filter({$0.name.lowercased().contains(search!.lowercased())})
            }
            
            array = array.filter({ attachment -> Bool in
                let dumbArray = attachment.name.split(separator: "/")
                if dumbArray.count <= 2 && self.bc.count == 0{
                    return true
                }
                return false
            })
            result = array
            return array
            }
        
        return Output(back: back, tap: tap.mapToVoid(), select: select.mapToVoid(), safeboxAttachments: value, error: errorTracker.asDriver())
    }
    
}

extension MainSafeboxViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let taptrigger: Driver<UITabBarItem>
        let willAppearTrigger: Driver<Void>
        let searchTrigger: Driver<String?>
        let selectTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let back: Driver<Void>
        let tap: Driver<Void>
        let select: Driver<Void>
        let safeboxAttachments: Driver<[SafeboxAttachment]>
        let error: Driver<Error>
    }
}
