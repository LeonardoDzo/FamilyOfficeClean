//
//  FamilyViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 14/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class FamilyViewModel: ViewModelType {
    private let familyUseCase: FamilyUseCase!
    init(familyUseCase: FamilyUseCase) {
        self.familyUseCase = familyUseCase
    }
    func transform(input: FamilyViewModel.Input) -> FamilyViewModel.Output {
        let families = self.getFamilies(input.willAppearTrigger, self.familyUseCase).map { (families) -> [Family] in
            var fams = families
            fams.append(Family(name: ""))
            return fams
        }
        return Output(families: families)
    }
}
extension FamilyViewModel {
    struct Input {
        let willAppearTrigger: Driver<Void>
    }
    struct Output {
        let families: Driver<[Family]>
    }
}
