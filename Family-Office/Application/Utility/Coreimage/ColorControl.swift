//
//  ColorControl.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import CoreImage

class ColorControl: Brightnessable, Contrastable {

    // MARK: - Properties

    var filter = CIFilter(name: "CIColorControls")!
}


