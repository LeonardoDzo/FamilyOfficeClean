//
//  ChatsNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

final class ChatsNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    let service: RMUseCaseProvider!
    init(nc: UINavigationController, service: RMUseCaseProvider) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMain(sender: Any? = 0) {
        let view = ChatsTableViewController()
        if let type = sender as? Int {
            view.title = type == 0 ? "Mis chats" : "Mis grupos"
            view.viewwModel = ChatsViewmodel(navigator: self, byGroup: !(type == 0), chatUseCase: service.makeChatUseCase())
        }
        navigationController?.pushViewController(view, animated: true)
    }
    func toChat(_ chat: Chat) -> Void {
        let navigator = ChatNavigator(navigationController: navigationController!)
        navigator.toMain(sender: chat)
    }
    
    func toAddEdit(_ chat: Chat) -> Void {
        let navigator = AddEditChatNavigator(navigationController: self.navigationController!)
        navigator.toMain(sender: chat)
    }
}
