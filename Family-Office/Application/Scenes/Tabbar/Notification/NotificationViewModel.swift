//
//  NotificationViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class NotificationViewModel: ViewModelType {
    let applicationsUseCase: ApplicationUseCase!

    init(applicationUseCase: ApplicationUseCase) {
        self.applicationsUseCase = applicationUseCase
    }

    func transform(input: NotificationViewModel.Input) -> NotificationViewModel.Output {
        let result = input.trigger.flatMapLatest({_ in
            return self.applicationsUseCase
                        .getFamilyApplications().asDriverOnErrorJustComplete()
        })
        return Output(solicitudes: result)
    }
}
extension NotificationViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
         let solicitudes: Driver<[ApplicationFamily]>
    }
}
