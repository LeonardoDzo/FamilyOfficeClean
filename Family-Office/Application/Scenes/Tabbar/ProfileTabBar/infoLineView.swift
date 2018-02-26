//
//  infoLineView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class InfoLineView: UIViewX {
    var textline: UILabelX = UILabelX()
    var photo: UIImageViewX = UIImageViewX()
    convenience init() {
        self.init(frame: .zero)
        render()
    }
    func render() {
        sv(photo, textline)
        layout(
        0,
        |-0-photo.width(60)-4-textline.width(100%).height(20)| ~ 60,
        0)

        textline.centerVertically()
    }

    func setStyles(handler: @escaping ((InfoLineView) -> Void)) {
        handler(self)
    }
}
