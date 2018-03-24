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
import UIKit

final class ChatViewModel: ViewModelType {

    let chatUseCase: ChatUseCase!
    
    let navigator: ChatNavigator!
    
    var chat: Chat!
    
    var text = ""
    
    init(chatUseCase: ChatUseCase, navigator: ChatNavigator, chat: Chat){
        self.chatUseCase = chatUseCase
        self.navigator = navigator
        self.chat = chat
    }
    
    func transform(input: ChatViewModel.Input) -> ChatViewModel.Output {
        
        
        let chattrigger = input.willAppear.flatMapLatest {
            return self.chatUseCase
                .get(id: self.chat.uid)
                .asDriverOnErrorJustComplete()
            }.do(onNext: {self.chat = $0})
        

        let messages = chattrigger.flatMapLatest { (chat) in
            return self.chatUseCase
                .getMessage(chatId: chat.uid)
                .asDriverOnErrorJustComplete()
                .map({ (mess) -> [SectionOfMessages] in
                    return Dictionary(grouping: mess.reversed()) { m -> Date in
                        return Date(m.seenAt)?.midnight() ?? Date()
                        }.map({SectionOfMessages(value: $0)})
                })
            }.do(onNext: { _ in
                NetUseCaseProvider().makeChatUseCase()
                    .seenToChat(id: self.chat.uid)
                    .subscribe()
                    .dispose()
            })
        
        let textChanged  = input.textChange.do(onNext: {self.text = $0})
        
        let sendMessage = input.sendMessage.flatMapLatest({_ -> SharedSequence<DriverSharingStrategy, Void> in
            return self.sendMessage()
        })
        
        let selectedInfo = input.selectInfo.withLatestFrom(chattrigger)
            .do(onNext: self.navigator.toInfoChat)
        
        let selectcell = Driver.combineLatest(input.selectCell, messages).map({ indexpath, sections -> (String, [(Int,ChatMessage)]) in
            let isValid = sections[indexpath.section].items[indexpath.row].attachment?.isImage ?? false
            let uid = sections[indexpath.section].items[indexpath.row].uid
            if isValid {
               return (uid, sections[indexpath.section].items.enumerated().filter({ (i,m) -> Bool in
                    return m.attachment?.isImage ?? false
                    }))
            }
            return (uid, [])
        }).map({ arg -> (String, [AttachmentViewModel]) in
            return (arg.0, arg.1.map({ (item) -> AttachmentViewModel in
                let (i, chatm) = item
                return AttachmentViewModel(message: chatm,index: i)
            }))
        })
    
        return Output(messages: messages, infoChat: chattrigger, sendMessage: sendMessage, messageChange: textChanged.mapToVoid(), tapCamera: input.tapCameraTrigger, selectedInfo: selectedInfo.mapToVoid(), selectCell: selectcell)
    }
    
    deinit {
        chat = nil
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
        let selectInfo: Driver<Void>
        let selectCell: Driver<IndexPath>
    }
    struct Output {
        let messages: Driver<[SectionOfMessages]>
        let infoChat: Driver<Chat>
        let sendMessage: Driver<Void>
        let messageChange: Driver<Void>
        let tapCamera: Driver<Void>
        let selectedInfo: Driver<Void>
        let selectCell: Driver<(String, [AttachmentViewModel])>
    }
}
