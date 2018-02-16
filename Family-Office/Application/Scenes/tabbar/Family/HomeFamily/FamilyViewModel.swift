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
import UIKit

class FamilyViewModel: ViewModelType {
    private let familyUseCase: FamilyUseCase!
    private let navigator: HomeFamilyNavigator!
    private var families = [Family]()
    init(familyUseCase: FamilyUseCase, navigator: HomeFamilyNavigator) {
        self.familyUseCase = familyUseCase
        self.navigator = navigator
    }
    func transform(input: FamilyViewModel.Input) -> FamilyViewModel.Output {
        self.families.append(Family(name: ""))
        let families = self.getFamilies(input.willAppearTrigger, self.familyUseCase).map { (families) -> [Family] in
            self.families = families
            self.families.append(Family(name: ""))
            return self.families
        }
        let selected = input.selectTrigger.do(onNext: { indexpath in
            let fam = self.families[indexpath.row]
            fam.uid.isEmpty ? self.navigator.addfamily() : self.navigator.familyProfile(fam: fam)
        }).mapToVoid()
        return Output(families: families, selected: selected)
    }
}
extension FamilyViewModel {
    struct Input {
        let willAppearTrigger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    struct Output {
        let families: Driver<[Family]>
        let selected: Driver<Void>
    }
}
