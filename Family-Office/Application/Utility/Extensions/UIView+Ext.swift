//
//  UIView+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func animations() {
        for view in self.subviews as [UIView] {
            if let v = view as? Springable {
                v.animate()
            }
        }
    }
}
