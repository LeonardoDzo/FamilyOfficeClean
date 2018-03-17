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
    /// se comunica con realm
    let chatUseCase: ChatUseCase!
    
    /// Se comunica con la api
    let netChatUseCase: ChatUseCase!
    
    let navigator: ChatNavigator!
    
    var chat: Chat!
    
    var me: User!
    init(chatUseCase: ChatUseCase, netChatUseCase: ChatUseCase, navigator: ChatNavigator) {
        self.chatUseCase = chatUseCase
        self.netChatUseCase = netChatUseCase
        self.navigator = navigator
    }
    
    func transform(input: ChatViewModel.Input) -> ChatViewModel.Output {
        
        let uid = UserDefaults().value(forKey: "uid") as? String ?? ""
        
        
        let chattrigger = input.willAppear.flatMapLatest {
            return self.chatUseCase
                .get(id: self.chat.uid)
                .asDriverOnErrorJustComplete()
            }.do(onNext: {self.chat = $0})
        
        
        
        let messages = chattrigger.map({ chat in
            return  chat.messages.map({
                MockMessage(text: $0.text,
                            sender: $0.sender!,
                            messageId: $0.uid,
                            date: Date($0.seenAt) ?? Date())
                
            })
        }).map { (messages)  in
            return Dictionary(grouping: messages.reversed()) { (message) -> Date in
                return message.sentDate.midnight()
                }.map({SectionOfMessages(value: $0)})
        }
        
        let sendMessage = input.sendMessage.flatMapLatest({ (arg) -> SharedSequence<DriverSharingStrategy, Void> in
            let (_,_) = arg
            var message = ChatMessage()
            let me = self.chat.members.first(where: {$0.user!.uid == uid})
            message.seenAt = Date().toMillis()
            message.uid = UUID().uuidString
            message.sender = Sender(uid: uid, displayName: (me!.user?.displayName)!, photo: (me!.user?.photo)!)
            message.text = arg.1
            return self.netChatUseCase
                .save(chatId: self.chat.uid, message: message)
                .asDriverOnErrorJustComplete()
        })
        return Output(messages: messages, infoChat: chattrigger, sendMessage: sendMessage)
        
    }
}
extension ChatViewModel {
    struct Input {
        let willAppear: Driver<Void>
        let sendMessage: Driver<(Void, String)>
    }
    struct Output {
        let messages: Driver<[SectionOfMessages]>
        let infoChat: Driver<Chat>
        let sendMessage: Driver<Void>
    }
}