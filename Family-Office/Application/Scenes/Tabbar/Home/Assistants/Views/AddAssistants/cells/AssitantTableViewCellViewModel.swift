//
//  AssitantTableViewCellViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class AssistantInviteCellViewModel: ViewModelType {
 
    
    let solicitudeUseCase: ApplicationAssistantUseCase!
    var family: Family!
    init(solicitudeUseCase: ApplicationAssistantUseCase) {
        self.solicitudeUseCase = solicitudeUseCase
        
    }
    func transform(input: AssistantInviteCellViewModel.Input) -> AssistantInviteCellViewModel.Output {
        let tap = input.inviteTrigger.flatMapLatest { (arg0) -> SharedSequence<DriverSharingStrategy, Void> in
            let (_, user) = arg0
            var solicitude = ApplicationAssistant()
            solicitude.assistant = user!
            return self.solicitudeUseCase.save(appAssistant: solicitude).asDriverOnErrorJustComplete()
        }
        return Output(invited: tap)
    }
}
extension AssistantInviteCellViewModel {
    struct Input {
        let inviteTrigger: Driver<(Void, User?)>
    }
    struct Output {
        let invited: Driver<Void>
    }
}
