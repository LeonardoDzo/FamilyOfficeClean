//
//  ILLNESSTYPE.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

extension ILLNESSTYPE {
    var color: UIColor {
        switch self {
        case .Disease:
            return #colorLiteral(red: 0.7685001586, green: 0.00719451062, blue: 0, alpha: 1)
        default:
            return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
    }
}
