//
//  ChatNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class ChatNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toMain(sender: Any?) {
        if let chat = sender as? Chat {
            let view = ChatViewController()
            view.viewModel = ChatViewModel(chatUseCase: RMUseCaseProvider().makeChatUseCase(), navigator: self, chat: chat)
           
            NetUseCaseProvider().makeChatUseCase().seenToChat(id: chat.uid).asDriverOnErrorJustComplete().drive().dispose()
            
            navigationController?.pushViewController(view, animated: true)
        }
        return
    }
    func toInfoChat(_ chat: Chat) -> Void {
        let navigator = ProfileChatNavigator(navigationController: navigationController!)
        navigator.toMain(sender: chat)
    }
   
}
