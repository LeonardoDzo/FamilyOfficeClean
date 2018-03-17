//
//  MainIllnessViewmodel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit


final class MainIllnessViewModel: ViewModelType {
    let navigator: MainIllnessNavigator!
    let illnessUseCase: IllnessUseCase!
    var isEditting: Bool = false
    var filter = Variable(0)
    
    init(navigator: MainIllnessNavigator, useCase: IllnessUseCase) {
        self.illnessUseCase = useCase
        self.navigator = navigator
    }
    
    func transform(input: MainIllnessViewModel.Input) -> MainIllnessViewModel.Output {
        let back = input.backTrigger.do(onNext: self.navigator.toDissmiss)
        let errorTracker = ErrorTracker()
        var result = [Illness]()
        let value = input.willAppearTrigger.flatMapLatest {
            return self.illnessUseCase
                .get()
                .trackError(errorTracker)
                .asDriverOnErrorJustComplete()
            }.do(onNext: {result = $0})
        
        
        let tap = input.taptrigger.do(onNext: {
           
            switch $0.tag{
                case 3:
                    self.navigator.toAddEdit()
                    break
                default:
                    break
            }
        })
        
        

        
        let illness =  Driver.combineLatest(value, tap, input.searchTrigger, value) { values,tap,search,val   -> [Illness] in
            var value: [Illness]! = values
    
            switch tap.tag{
                case 1:
                    value = values.filter({$0.type == .Pain})
                    break
                case 2:
                    value = values.filter({$0.type == .Disease})
                    break
                default:
                    value = values
            }
            if(!(search?.isEmpty)!){
                value = value.filter({$0.name.lowercased().contains(search!.lowercased()) || $0.medicines.lowercased().contains(search!.lowercased())})
            }
            return value
        }
        
        let edit = input.selectIllness.do(onNext: { (i) in
            if !self.isEditting {
                self.navigator.toAddEdit(illness: result[i.row])
            }else{
                self.navigator.toDissmiss()
            }
        }).asDriver().mapToVoid()
        return Output(back: back, tap: tap.mapToVoid(), illness: illness, error: errorTracker.asDriver(), modeEdit: input.editTrigger, selectedIllness: edit )
    }
}
extension MainIllnessViewModel {
    struct Input {
        let backTrigger: Driver<Void>
        let taptrigger: Driver<UITabBarItem>
        let willAppearTrigger: Driver<Void>
        let searchTrigger: Driver<String?>
        let editTrigger: Driver<Void>
        let selectIllness: Driver<IndexPath>
    }
    struct Output {
        let back: Driver<Void>
        let tap: Driver<Void>
        let illness: Driver<[Illness]>
        let error: Driver<Error>
        let modeEdit: Driver<Void>
        let selectedIllness: Driver<Void>
    }
}
