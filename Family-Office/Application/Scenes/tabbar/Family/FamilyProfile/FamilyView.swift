//
//  FamilyView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

final class FamilyProfileView : UIViewX, FamilyBindable {
    var family: Family!
    var backButton = UIButtonX()
    let menu = MenuMainAss(total: ["Miembros", "Imagenes", "Eventos"], colorPrimary: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var photo: UIImageViewX! = UIImageViewX()
    var titleLbl: UILabelX! = UILabelX()
    var selected = 0
    convenience init(){
        self.init(frame: .zero)
        render()
    }
    func render() -> Void {
        sv(photo,titleLbl,menu,backButton)
       
        
        photo.top(0).left(0).right(0).height(30%).width(100%)
        
        menu.top(33%).height(60).width(100%).left(0).right(0)
        
        titleLbl.font = titleLbl.font.withSize(24)
        titleLbl.top(15%).width(100%).height(24).centerHorizontally()
        titleLbl.textAlignment = .center
        titleLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        backButton.top(5%).left(5%).width(25).height(25)
        backButton.setImage(#imageLiteral(resourceName: "back-27x20").maskWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        
        animation = "squeezeLeft"
        self.animations()
        
        menu.btns.forEach { (btn) in
           btn.addTarget(self, action: #selector(self.changeType(_:)), for: .touchUpInside)
        }
        
    }
    
    @objc
    func changeType(_ sender: UIButtonX) {
        menu.indexLine(from: selected, to: sender.tag)
        self.selected = sender.tag
    }
  
}
