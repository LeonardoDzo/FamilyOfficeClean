//
//  Task.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class PendingViewModel: NSObject, ViewModelType {
    private let usecases: PendingUseCase!
    private let assistantUseCase: UserUseCase!
    private let navigator: AssistantMainNavigator!
    var assistandId: Variable<String>! = Variable(getAssitantid())
    var selected = Variable(0)
    init(usecases: PendingUseCase, userUseCase: UserUseCase, navigator: AssistantMainNavigator) {
        self.usecases = usecases
        self.navigator = navigator
        self.assistantUseCase = userUseCase
        super.init()
        UserDefaults.standard.addObserver(self, forKeyPath: "assistantId", options: NSKeyValueObservingOptions.new, context: nil)
    }

    func transform(input: PendingViewModel.Input) -> PendingViewModel.Output {
        let errorTracker = ErrorTracker()

        let pendings =  Driver.combineLatest(input.trigger, self.assistandId.asDriver(), selected.asDriver()) { _, aid, btnSelected in
            return self.usecases.get()
                .trackError(errorTracker)
                .map({$0.filter({ (pending) -> Bool in
                    let isAssitantId = pending.assistantId == aid
                    var flag = true
                    switch btnSelected {
                        case 1:
                            flag = !pending.done
                            break
                        case 2:
                            flag = pending.done
                            break
                        default:
                            break
                    }
                    return isAssitantId && flag
                }).sorted(by: {$0.created_at > $1.created_at})})
                .asDriverOnErrorJustComplete()
            }.flatMap({$0})

        let btns = input.menu.map { (btn) in
          btn.do(onNext: { self.selected.value = $0})
        }
        
    
        let assistants = input.trigger.flatMapLatest {
            return self.assistantUseCase
                .getAssistants()
                .asDriverOnErrorJustComplete()
            }.do(onNext:  {users in
                if users.isEmpty {
                    self.navigator.toAddAssistant()
                }
            })
        
        let back = input.backtrigger.do(onNext: self.navigator.toBack)
        let edit = input.editTrigger.startWith(())
        return Output(pendings: pendings, assistants: assistants, backTrigger: back, modeEdit: edit, btns: btns)
    }
    deinit {
        UserDefaults.standard.removeObserver(self, forKeyPath: "assistantId")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        assistandId.value = getAssitantid()
    }
}
extension PendingViewModel {
    struct Input {
        let trigger: Driver<Void>
        let editTrigger: Driver<Void>
        let backtrigger: Driver<Void>
        let gotoAddAssistant: Driver<Void>
        let menu: [Driver<Int>]
    }
    struct Output {
        let pendings: Driver<[Pending]>
        let assistants: Driver<[User]>
        let backTrigger: Driver<Void>
        let modeEdit: Driver<Void>
        let btns: [Driver<Int>]
       
    }
}
