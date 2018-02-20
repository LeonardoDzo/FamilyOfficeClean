//
//  AddEditFamily.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class AddEditFamily: UIViewX {
    var familyPhoto = imgEditable()
    var cancelBtn = UIButtonX()
    var saveBtn = UIButtonX()
    
    var nameTxt = UITextFieldX()
    fileprivate var colorControl = ColorControl()
    convenience init(){
        self.init(frame:CGRect.zero)
        render()
    }
    
    fileprivate func render() {
        sv(familyPhoto,nameTxt,cancelBtn,saveBtn)
        layout(
            0,
            |familyPhoto.width(100%).height(35%)|,
            ""
        )
        nameTxt.top(17.5%).width(100%).centerHorizontally()
        
        saveBtn.width(40).height(40).top(5%).right(5%)
        saveBtn.setImage(#imageLiteral(resourceName: "icons8-save"), for: .normal)
        
        cancelBtn.width(40).height(40).top(5%).left(5%)
        cancelBtn.setImage(#imageLiteral(resourceName: "icons8-expand_arrow"), for: .normal)
        nameTxt.style { (txt) in
            txt.textAlignment = .center
            txt.font = txt.font?.withSize(24)
            txt.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            txt.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 0.3003777876)
            txt.attributedPlaceholder = NSAttributedString(string: "Nombre de la Familia",
                                                           attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        }
       
        familyPhoto.img.style { (img) in
            colorControl.input(#imageLiteral(resourceName: "icons8-family"))
            img.contentMode = .center
            DispatchQueue.main.async {
                self.colorControl.brightness(0.3)
                img.image = self.colorControl.outputUIImage()
            }
        }
        
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
    }
    
}
