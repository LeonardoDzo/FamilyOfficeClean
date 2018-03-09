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
        }
        navigationController?.pushViewController(view, animated: true)
    }
}
