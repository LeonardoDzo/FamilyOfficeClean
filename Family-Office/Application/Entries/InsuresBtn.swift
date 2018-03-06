//
//  InsuresBtn.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

extension INSURANCETYPE {
    var image: UIImage {
        switch self {
        case .cars:
            return #imageLiteral(resourceName: "insurances-cars")
        case .homes:
            return #imageLiteral(resourceName: "insurances-homes")
        case .lifes:
            return #imageLiteral(resourceName: "insurances-lifes")
        case .med:
            return #imageLiteral(resourceName: "insurances-med")
        }
    }
}

