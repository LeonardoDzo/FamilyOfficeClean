//
//  AddEditNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol AddEditNavigatorPr {
    func toPrehome()
}

class AddEditNavigator: AddEditNavigatorPr{
    private let navigationController: UINavigationController
    init( nc: UINavigationController) {
        self.navigationController = nc
    }
    
    func toPrehome() {
         navigationController.dismiss(animated: true)
    }
}
