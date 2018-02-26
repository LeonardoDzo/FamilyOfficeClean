//
//  menuNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol MenuNavigatorPr {
    func logout()
}

final class MenuNavigator: MenuNavigatorPr {

    init() {}
    func logout() {

        if let top = UIApplication.topViewController() {
            top.dismiss(animated: true, completion: {
                  if let top = UIApplication.topViewController() {
                    let nc = UINavigationController()
                    nc.view.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 0)
                    nc.isNavigationBarHidden = true
                    let signInNavigator = DefaultAuthNavigator(service: NetUseCaseProvider(), nc: nc)
                    top.present(nc, animated: true, completion: nil)
                    signInNavigator.toSignIn()
                }
            })
        }
    }
}
