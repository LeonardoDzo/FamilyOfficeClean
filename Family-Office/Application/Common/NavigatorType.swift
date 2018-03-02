//
//  NavigatorType.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
protocol NavigatorType {
    var navigationController: UINavigationController? {get set}
    func toDissmiss() -> Void
    func toPop() -> Void
    func toMain(sender: Any?) -> Void
}
extension NavigatorType {
    func toDissmiss() -> Void {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    func toPop() -> Void {
        navigationController?.popViewController(animated: true)
    }
}
