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

final class MenuNavigator : MenuNavigatorPr {

    init() {}
    func logout() {
        
        if let top = UIApplication.topViewController() {
            top.dismiss(animated: true, completion: {
                  if let top = UIApplication.topViewController() {
                    let nc = top.navigationController!
                    let signInNavigator = DefaultAuthNavigator(service: NetUseCaseProvider(), nc: nc)
                    signInNavigator.toSignIn(true)
                }
            })
        }
    }
}
