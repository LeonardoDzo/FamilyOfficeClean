//
//  UserInviteViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

final class UserInviteCellViewModel: ViewModelType {
    let solicitudeUseCase: SolicitudeUseCase!
    let familyUseCase: FamilyUseCase!
    var family: Family!
    init(solicitudeUseCase: SolicitudeUseCase, familyUseCase: FamilyUseCase) {
        self.solicitudeUseCase = solicitudeUseCase
        self.familyUseCase = familyUseCase
        getFamily()
        
    }
    func transform(input: UserInviteCellViewModel.Input) -> UserInviteCellViewModel.Output {
        let tap = input.inviteTrigger.flatMapLatest { (arg0) -> SharedSequence<DriverSharingStrategy, Void> in
            let (_, user) = arg0
            var solicitude = Solicitude()
            solicitude.from = user!.uid
            solicitude.to = self.family.uid
            return self.solicitudeUseCase.save(solicitude: solicitude).asDriverOnErrorJustComplete()
        }
        return Output(invited: tap)
    }
    func getFamily() -> Void {
        self.familyUseCase
            .getFamilyActive()
            .asDriverOnErrorJustComplete()
            .do(onNext: { (family) in
                self.family = family
            }).drive().dispose()
    }
}
extension UserInviteCellViewModel {
    struct Input {
        let inviteTrigger: Driver<(Void, User?)>
    }
    struct Output {
        let invited: Driver<Void>
    }
}
