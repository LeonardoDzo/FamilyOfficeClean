//
//  AddEditChatNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 20/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
final class AddEditChatNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toMain(sender: Any?) {
        let view = AddEditChatViewController()
        if let chat = sender as? Chat {
            view.chat = chat
        }else{
            view.chat = Chat(family: nil, group: ChatGroup(name: "", photo: nil), uid: "", lastMessage: nil, members: [], messages: [])
        }
        navigationController?.pushViewController(view, animated: true)
        
    }
}
