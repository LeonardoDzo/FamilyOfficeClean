//
//  MenuAssistantViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 21/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift

final class MenuAssistantViewModel: ViewModelType {
    private var userUseCase: UserUseCase!
    var assitant = Variable(assistantId)
    
    init(userUseCase: UserUseCase) {
        self.userUseCase = userUseCase
    }
    
    func transform(input: MenuAssistantViewModel.Input) -> MenuAssistantViewModel.Output {
        
        let users = input.trigger.flatMapLatest({
            return self.userUseCase
                .getUsers(phones: [], rol: 1)
                .asDriverOnErrorJustComplete()
        })
        let selected = input.select.withLatestFrom(users) { indexpath, users in
            let uid = users[indexpath.row].uid
            UserDefaults().set(uid, forKey: "assistantId")
            self.assitant.value = uid
        }.mapToVoid()
        
        let assistants = Driver.combineLatest(assitant.asDriver(), users) {  aid, users in
            return users.map({ (u) -> (User,Bool) in
                let result = u.uid == aid
                return (u, result)
            })
        }

        return Output(assistants: assistants, selected: selected, added: input.add)
    }
 

}
extension MenuAssistantViewModel {
    struct Input {
        let trigger: Driver<Void>
        let select: Driver<IndexPath>
        let add: Driver<Void>
    }
    struct Output {
        let assistants: Driver<[(User,Bool)]>
        let selected: Driver<Void>
        let added: Driver<Void>
    }
}
