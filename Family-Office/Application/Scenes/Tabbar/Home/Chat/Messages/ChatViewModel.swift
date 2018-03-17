//
//  ChatViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class ChatViewModel: ViewModelType {

    let chatUseCase: ChatUseCase!
    
    let navigator: ChatNavigator!
    
    var chat: Chat!
    
    var text = ""
    
    init(chatUseCase: ChatUseCase, navigator: ChatNavigator) {
        self.chatUseCase = chatUseCase
        self.navigator = navigator
    }
    
    func transform(input: ChatViewModel.Input) -> ChatViewModel.Output {
        
        
        let chattrigger = input.willAppear.flatMapLatest {
            return self.chatUseCase
                .get(id: self.chat.uid)
                .asDriverOnErrorJustComplete()
            }.do(onNext: {self.chat = $0})
        

        let messages = chattrigger.map({ (chat)  in
            return Dictionary(grouping: chat.messages.reversed()) { (message) -> Date in
                return Date(message.seenAt)?.midnight() ?? Date()
                }.reversed().map({SectionOfMessages(value: $0)})
        }).do(onNext: { _ in
            NetUseCaseProvider().makeChatUseCase()
                .seenToChat(id: self.chat.uid)
                .asDriverOnErrorJustComplete()
                .drive()
                .dispose()
        })
        
        let textChanged  = input.textChange.do(onNext: {self.text = $0})
        
        let sendMessage = input.sendMessage.flatMapLatest({_ -> SharedSequence<DriverSharingStrategy, Void> in
            return self.sendMessage()
        })
        
        let image = input.imageSelected.map { (value) in
            return value
        }
        let selectedInfo = input.selectInfo.withLatestFrom(chattrigger) {_, chat in
            return chat
            }.do(onNext: {self.navigator.toInfoChat($0)})
        
        return Output(messages: messages, infoChat: chattrigger, sendMessage: sendMessage, messageChange: textChanged.mapToVoid(), tapCamera: input.tapCameraTrigger, imageSelected: image, selectedInfo: selectedInfo.mapToVoid())
    }
    
    func sendMessage(data: Data? = nil) -> SharedSequence<DriverSharingStrategy, Void> {
        var message = ChatMessage()
        let meUser = self.chat.members.first(where: {$0.user!.uid == me})
        message.seenAt = Date().toMillis()
        message.uid = UUID().uuidString
        message.sender = Sender(uid: me, displayName: (meUser!.user?.displayName)!, photo: (meUser!.user?.photo))
        message.text = self.text
        message.data = data
        return self.chatUseCase
            .save(chatId: self.chat.uid, message: message)
            .asDriverOnErrorJustComplete()
    }

}
extension ChatViewModel {
    struct Input {
        let willAppear: Driver<Void>
        let textChange: Driver<String>
        let sendMessage: Driver<Void>
        let tapCameraTrigger: Driver<Void>
        let imageSelected: Driver<[Any]>
        let selectInfo: Driver<Void>
    }
    struct Output {
        let messages: Driver<[SectionOfMessages]>
        let infoChat: Driver<Chat>
        let sendMessage: Driver<Void>
        let messageChange: Driver<Void>
        let tapCamera: Driver<Void>
        let imageSelected: Driver<[Any]>
        let selectedInfo: Driver<Void>
       
    }
}
