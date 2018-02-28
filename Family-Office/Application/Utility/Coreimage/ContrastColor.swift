//
//  ContrastColor.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 27/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import CoreImage

protocol Contrastable: Processable {
    var minContrastValue: Float { get }
    var maxContrastValue: Float { get }
    var currentContrastValue: Float { get }
    func contrast(_ contrast: Float)
}

extension Contrastable {
    
    var minContrastValue: Float {
        return 0.00
    }
    
    var maxContrastValue: Float {
        return 4.00
    }
    
    var currentContrastValue: Float {
        return filter.value(forKey: kCIInputContrastKey) as? Float ?? 1.00
    }
    
    func contrast(_ contrast: Float) {
        self.filter.setValue(contrast, forKey: kCIInputContrastKey)
    }
}
