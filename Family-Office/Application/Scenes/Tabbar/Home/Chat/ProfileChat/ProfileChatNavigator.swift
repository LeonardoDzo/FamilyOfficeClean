//
//  ProfileChatNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 17/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

final class ProfileChatNavigator: NavigatorType {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    func toMain(sender: Any?) {
        if let chat = sender as? Chat {
            let view = ProfileChatViewController()
            view.chat = chat
            navigationController?.pushViewController(view, animated: true)
        }
        return
    }
}
