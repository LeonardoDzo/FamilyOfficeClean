//
//  MembersChatViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class MembersChatViewModel: ViewModelType {
    let navigator: MembersChatNavigator!
    let userUseCase: UserUseCase!
    let chatUSeCase: ChatUseCase!
    let netChatUSeCase: ChatUseCase!
    var users: [User]!
    init(navigator: MembersChatNavigator, userUseCase: UserUseCase, chatUSeCase: ChatUseCase, netChatUSeCase: ChatUseCase) {
        self.userUseCase = userUseCase
        self.navigator = navigator
        self.chatUSeCase = chatUSeCase
        self.netChatUSeCase = netChatUSeCase
    }
    func transform(input: MembersChatViewModel.Input) -> MembersChatViewModel.Output {
        let error = ErrorTracker()
        let uid = UserDefaults().value(forKey: "uid") as? String ?? ""
        var himId = ""
        let users = input.appearTrigger.flatMapLatest {_ in
            return self.userUseCase.getUsers(phones: [], rol: 0)
                .map({$0.filter({$0.uid != uid})})
                .trackError(error)
                .asDriverOnErrorJustComplete()
            }.do(onNext: {self.users = $0.filter({$0.uid != uid})})
        
        let selected = input.selectUserTrigger.flatMapLatest({ indexpath -> SharedSequence<DriverSharingStrategy, Chat> in
            himId = self.users[indexpath.row].uid
            return self.chatUSeCase
                .get(uid: himId)
                .asDriverOnErrorJustComplete()
        }).flatMapLatest({ chat -> SharedSequence<DriverSharingStrategy, Chat> in
            if chat.uid.isEmpty {
                return self.netChatUSeCase
                    .create(userId: himId)
                    .asDriverOnErrorJustComplete()
            }
            return BehaviorRelay(value: chat).asDriver()
        }).do(onNext: {self.navigator.toChat($0)})
        
        return Output(users: users, selected: selected)
    }
}
extension MembersChatViewModel {
    struct Input {
        let appearTrigger: Driver<Void>
        let selectUserTrigger: Driver<IndexPath>
    }
    struct Output {
        let users: Driver<[User]>
        let selected: Driver<Chat>
    }
}
