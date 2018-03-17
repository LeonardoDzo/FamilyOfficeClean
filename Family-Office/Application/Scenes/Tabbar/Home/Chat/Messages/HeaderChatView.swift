//
//  HeaderChatView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 16/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

final class headerChatView: UIViewX{

    
    var container: UIViewX! = UIViewX()
    var title: UILabelX! = UILabelX()
    
    convenience init(){
        self.init(frame: .zero)
        render()
    }
    
    func render() -> Void {
        sv(container.sv(title))
        container.layout(
        2,
        |-2-title-2-|,
        2)
        container.width(>=40)
        title.numberOfLines = 0
    }
}
