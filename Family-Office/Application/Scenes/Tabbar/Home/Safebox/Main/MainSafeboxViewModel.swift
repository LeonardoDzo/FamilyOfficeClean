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
    var bc:[String] = [""]
    var entered:Bool = false // LMAOOOOOOOOOOO
    
    init(navigator: MainSafeboxNavigator, safeboxUseCase: SafeboxUseCase){
        self.navigator = navigator
        self.safeboxUseCase = safeboxUseCase
    }
    
    func back(){}
    
    func transform(input: MainSafeboxViewModel.Input) -> MainSafeboxViewModel.Output {
        let back = input.backTrigger.do(onNext: { sabe in
            if self.entered {
                if self.bc.count == 1 {
                    self.navigator.toDissmiss()
                }else{
                    _ = self.bc.popLast()
                }
            }else{
                self.entered = true
            }
            
            
        })
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
            print("TABLE")
            if(indexpath.row >= 0){
                let selectedItem = result[indexpath.row]
                
                let dumbArray = selectedItem.name.split(separator: "/")
                if NSString(string: String(describing: dumbArray[self.bc.count - 1])).pathExtension == ""{
                    self.bc.append(String(describing: dumbArray[dumbArray.count - 2]))
                }else{
                    print("Abrir archivooo")
                }
            }
        })
        
        let selectColl = input.selectCollTrigger.do(onNext: { indexpath in
            print("COLLECTION")
            if(indexpath.row >= 0){
                let selectedItem = result[indexpath.row]
                
                let dumbArray = selectedItem.name.split(separator: "/")
                if NSString(string: String(describing: dumbArray[self.bc.count - 1])).pathExtension == ""{
                    self.bc.append(String(describing: dumbArray[dumbArray.count - 2]))
                }else{
                    print("Abrir archivooo")
                }
            }
        })
        
        let safeboxAttachments = Driver.combineLatest(value, tap, input.searchTrigger, input.selectTrigger, selectColl, back) {values, tap, search, select, selectColl, back -> [SafeboxAttachment] in
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
                if dumbArray.count == 1 {
                    return self.bc.last == ""
                }
                if dumbArray.count <= 2 && self.bc.count == 1{
                    return true
                }else{
                    let index = dumbArray.index(of:Substring(self.bc.last!))
                    if index != nil{
                        return self.bc.count + 1 >= dumbArray.count
                    }else{
                        return false
                    }

                }
            })
            result = array
            return array
            }
        
        return Output(back: back.mapToVoid(), tap: tap.mapToVoid(), select: select.mapToVoid(), selectColl: selectColl.mapToVoid(), safeboxAttachments: safeboxAttachments, error: errorTracker.asDriver())
    }
    
}

extension MainSafeboxViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let taptrigger: Driver<UITabBarItem>
        let willAppearTrigger: Driver<Void>
        let searchTrigger: Driver<String?>
        let selectTrigger: Driver<IndexPath>
        let selectCollTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let back: Driver<Void>
        let tap: Driver<Void>
        let select: Driver<Void>
        let selectColl: Driver<Void>
        let safeboxAttachments: Driver<[SafeboxAttachment]>
        let error: Driver<Error>
    }
}
