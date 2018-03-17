//
//  titleView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 16/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

final class titleView: UIViewX, ChatBindible {
    var chat: Chat!
    
    var photo: UIImageViewX! = UIImageViewX()
    
    var title: UILabelX! = UILabelX()
    
    convenience init(){
        self.init(frame: .zero)
        render()
        isUserInteractionEnabled = true
    }
    
    func render() -> Void {
        sv(photo,title)
        photo.isUserInteractionEnabled = true
        photo.size(40).centerVertically()
        alignHorizontally(|-photo-title-|)
    }
}
