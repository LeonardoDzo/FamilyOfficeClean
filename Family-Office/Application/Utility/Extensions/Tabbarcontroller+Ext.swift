//
//  Tabbarcontroller+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    
    func setStyle(_ style: HomeBtn) -> Void {
        self.viewControllers?.forEach({ (vc) in
            if let nc = vc as? UINavigationController {
                nc.navigationBar.barTintColor = style.color
                nc.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        })
        
        self.tabBarController?.tabBar.tintColor = style.color
    }
}
