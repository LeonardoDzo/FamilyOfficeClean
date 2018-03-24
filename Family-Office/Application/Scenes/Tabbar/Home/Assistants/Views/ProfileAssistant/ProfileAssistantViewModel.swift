//
//  ProfileAssistantViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

func getAssitantid() -> String {
    return UserDefaults().value(forKey: "assistantId") as? String ?? ""
}

final class ProfileAsssistantViewModel: NSObject, ViewModelType {
     private let usecases: PendingUseCase!
    let assistantUseCase: UserUseCase!
    let navigator: ProfileAssistantNavigator!
    var assistandId: Variable<String>! = Variable(getAssitantid())
    
    init(usecases: PendingUseCase, assistantUseCase: UserUseCase, navigator: ProfileAssistantNavigator) {
        self.assistantUseCase = assistantUseCase
        self.navigator = navigator
         self.usecases = usecases
        super.init()
        UserDefaults.standard.addObserver(self, forKeyPath: "assistantId", options: NSKeyValueObservingOptions.new, context: nil)
    }
    func transform(input: ProfileAsssistantViewModel.Input) -> ProfileAsssistantViewModel.Output {
        let errorTracker = ErrorTracker()
        
        let pendings = Driver.combineLatest(input.trigger, self.assistandId.asDriver()) { _, aid in
            return self.usecases.get()
                .trackError(errorTracker)
                .map({$0.filter({$0.assistantId == self.assistandId.value})})
                .asDriverOnErrorJustComplete()
            }.flatMap({$0})
        
        let assistants = Driver.combineLatest(input.trigger, assistandId.asDriver().startWith(getAssitantid())) { _,aid  in
            return self.assistantUseCase
                .getAssistants()
                .asDriverOnErrorJustComplete()
                .map({$0.filter({$0.uid == aid}).first ?? User(name: "", email: "", phone: "")})
            }.flatMap({$0})
        
        return Output(assistant: assistants, pendings: pendings)
    }
    
    deinit {
        UserDefaults.standard.removeObserver(self, forKeyPath: "assistantId")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        assistandId.value = getAssitantid()
    }
    
    
}
extension ProfileAsssistantViewModel {
    struct Input {
        let trigger: Driver<Void>
    }
    struct Output {
        let assistant: Driver<User>
        let pendings: Driver<[Pending]>
    }
}
