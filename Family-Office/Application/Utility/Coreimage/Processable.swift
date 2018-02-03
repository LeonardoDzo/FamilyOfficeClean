//
//  Processable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import CoreImage
import Foundation

protocol Processable {
    
    var filter: CIFilter { get }
    func input(_ image: UIImage)
    func outputUIImage() -> UIImage?
}


extension Processable {
    
    func input(_ image: UIImage) {
        if let cgImage = image.cgImage {
            
            let ciImage = CIImage(cgImage: cgImage)
            self.filter.setValue(ciImage, forKey: kCIInputImageKey)
        }
    }
}


extension Processable {
    
    func outputUIImage() -> UIImage? {
        
        if let outputImage = self.filter.outputImage {
            let openGLContext = EAGLContext(api: .openGLES3)!
            let ciImageContext = CIContext(eaglContext: openGLContext)
            
            if let cgImageNew = ciImageContext.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImageNew)
            }
        }
        
        return nil
    }
}
