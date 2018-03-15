//
//  ChatNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
class ChatNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toMain(sender: Any?) {
        if let chat = sender as? Chat, let top = UIApplication.topViewController(), !(top is ChatViewController) {
            let view = ChatViewController()
            view.viewModel = ChatViewModel(chatUseCase: RMUseCaseProvider().makeChatUseCase(), netChatUseCase: NetUseCaseProvider().makeChatUseCase(), navigator: self)
            view.viewModel.chat = chat
            navigationController?.pushViewController(view, animated: true)
        }
        return
    }
}
