//
//  UIImage+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!

        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)

        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 8, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!

        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)

        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
    func resizeImage()-> UIImage{
        if !(self.size.width * self.scale).isLess(than: CGFloat.init(1280)) || !(self.size.height * self.scale).isLess(than: CGFloat.init(1280)) {
            if self.isLandscape(){
                let newWidth = CGFloat.init(1280)
                let newHeight = self.size.height * (self.porcentSize(maxSize: newWidth)/100)
                UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
                self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
                
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                return newImage!
            }else{
                let newHeight = CGFloat.init(1280)
                let newWidth = self.size.width * (self.porcentSize(maxSize: newHeight)/100)
                UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
                self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
                
                let newImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                
                return newImage!
            }
        }
        return self
    }
    func jpeg(_ quality: JPEGQuality) -> Data? {
        return UIImageJPEGRepresentation(self, quality.rawValue)
    }
    
    internal func porcentSize(maxSize: CGFloat) -> CGFloat {
        if self.isLandscape(){
            let result: CGFloat = (maxSize * 100)/(self.size.width * self.scale)
            return result
        }else{
            let result: CGFloat = (maxSize * 100)/(self.size.height * self.scale)
            return result
        }
    }
    func isLandscape() -> Bool {
        if (self.size.width * self.scale).isLess(than: CGFloat.init(self.size.height * self.scale)){
            return false
        }else{
            return true
        }
    }
}
