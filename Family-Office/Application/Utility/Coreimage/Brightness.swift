//
//  Brightness.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 27/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import CoreImage

protocol Brightnessable: Processable {
    var minBrightnessValue: Float { get }
    var maxBrightnessValue: Float { get }
    var currentBrightnessValue: Float { get }
    func brightness(_ brightness: Float)
}

extension Brightnessable {
    
    var minBrightnessValue: Float {
        return -1.00
    }
    
    var maxBrightnessValue: Float {
        return 1.00
    }
    
    var currentBrightnessValue: Float {
        return filter.value(forKey: kCIInputBrightnessKey) as? Float ?? 0.00
    }
    
    func brightness(_ brightness: Float) {
        self.filter.setValue(brightness, forKey: kCIInputBrightnessKey)
    }
}
