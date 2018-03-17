//
//  ChatsViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ChatsViewmodel: ViewModelType {
    
    let byGroup: Bool!
    let navigator: ChatsNavigator!
    let chatUseCase: ChatUseCase!
    var chats = [Chat]()
    init(navigator: ChatsNavigator, byGroup: Bool = false, chatUseCase: ChatUseCase) {
        self.byGroup = byGroup
        self.navigator = navigator
        self.chatUseCase = chatUseCase
    }
    
    func transform(input: ChatsViewmodel.Input) -> ChatsViewmodel.Output {
        let chats = input.willAppearTriger.flatMapLatest {
            return self.chatUseCase
                .get(byGroup: self.byGroup)
                .asDriverOnErrorJustComplete()
            }.map {
                return $0.sorted(by: { (old, new) -> Bool in
                    let dateOne = old.messages.last?.seenAt ?? 0
                    let dateTwo = new.messages.last?.seenAt ?? 1
                    
                    return dateOne > dateTwo
                })
            }
            .do(onNext: {self.chats = $0})
        let selected = input.selectTrigger.flatMapLatest({ indexpath in
            return BehaviorRelay(value: self.chats[indexpath.row]).asDriver()
        }).do(onNext: {self.navigator.toChat($0)}).mapToVoid()
        
        return Output(chats: chats, selected: selected)
    }
    
    
}
extension ChatsViewmodel {
    struct Input {
        let willAppearTriger: Driver<Void>
        let selectTrigger: Driver<IndexPath>
    }
    struct Output {
        let chats: Driver<[Chat]>
        let selected: Driver<Void>
    }
}
