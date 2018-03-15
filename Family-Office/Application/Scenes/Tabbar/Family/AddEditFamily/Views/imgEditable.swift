//
//  imgEditable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import CoreImage

class imgEditable: UIViewX {
    var img: UIImageViewX = UIImageViewX()
    var editBtn: UIButtonX = UIButtonX()
    convenience init() {
        self.init(frame: .zero)
        render()
    }
    fileprivate func render() {
        sv(img, editBtn)
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        img.width(100%).height(100%)
        editBtn.right(5%).bottom(5%).width(10%).height(15%)
        editBtn.setImage(#imageLiteral(resourceName: "edit_image"), for: .normal)

    }
}
