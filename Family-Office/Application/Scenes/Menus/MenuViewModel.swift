//
//  MenuViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift

final class MenuViewModel: ViewModelType {
    private var familyUseCase: FamilyUseCase!
    init(service: FamilyUseCase) {
        self.familyUseCase = service
    }
    
    func transform(input: MenuViewModel.Input) -> MenuViewModel.Output {
       
        let families = self.getFamilies(input.trigger, self.familyUseCase)
        return Output(families: families)
    }
    
   
}
extension MenuViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
        let families: Driver<[Family]>
    }
}
