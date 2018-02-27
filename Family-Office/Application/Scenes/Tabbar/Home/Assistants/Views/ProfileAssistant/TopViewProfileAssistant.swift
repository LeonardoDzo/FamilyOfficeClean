//
//  TopViewProfileAssistant.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class TopViewProfileAssistant: UIViewX, UserBindable {
    
    var user: User!

    var profileImage: UIImageViewX! = UIImageViewX()
    var nameLbl: UILabelX! = UILabelX()
    var taskCompleteBtn: BtnWithLbl! = BtnWithLbl()
    var allTaskBtn: BtnWithLbl! = BtnWithLbl()
    var callBtn: BtnWithLbl! = BtnWithLbl()
    var phoneLbl: UILabelX! = UILabelX()

    convenience init() {
        self.init(frame: CGRect.zero)
        // This is only needed for live reload as injectionForXcode
        // doesn't swizzle init methods.
        // Get injectionForXcode here : http://johnholdsworth.com/injection.html
        render()
    }

    fileprivate func setStyleImage(_ img: UIImageViewX) {
        img.centerHorizontally()
        img.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        img.height(120).width(120)
        print( img.frame.width, img)
        img.cornerRadius = 60
        img.clipsToBounds = true
    }

    func render() {

        sv(
            profileImage,
            nameLbl,
            taskCompleteBtn,
            allTaskBtn,
            callBtn
        )

        layout(
            70,
            profileImage,
            5,
            nameLbl,
            10,
            |-30-allTaskBtn.width(30%)-60-taskCompleteBtn.width(30%)-60-callBtn.width(30%),
            ""
        )
        taskCompleteBtn.centerHorizontally()
        profileImage.style(self.setStyleImage)
        profileImage.image = #imageLiteral(resourceName: "icons8-businessman").maskWithColor(color: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        nameLbl.centerHorizontally()
        nameLbl.font =  UIFont(name: "Roboto", size: 20)
        nameLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        nameLbl.text("DUY LOCO HERNANDEZ")
        allTaskBtn.setFeatures { view in
            view.btn.setTitle("17", for: .normal)
            view.btn.style(self.setStyleBtn)
            view.lbl.text = "TAREAS"
            view.lbl.style(self.setStyleLbl)
        }

        taskCompleteBtn.setFeatures { (view) in
            view.btn.setTitle("10", for: .normal)
            view.btn.style(self.setStyleBtn)
            view.lbl.text = "TAREAS"
            view.lbl.style(self.setStyleLbl)
        }

        callBtn.setFeatures { view in
            view.btn.setImage(#imageLiteral(resourceName: "phone").maskWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))!, for: .normal)
            view.btn.style(self.setStyleBtn)
            view.lbl.text = "LLAMAR"

            view.lbl.style(self.setStyleLbl)
            view.btn.tag = 0
        }

        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "background_assistance"))
    }

    func setStyleBtn(btn: UIButtonX) {
        btn.width(50).height(50)
        btn.cornerRadius = 25
        btn.clipsToBounds = true
        btn.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        btn.borderWidth = 2
        btn.titleLabel?.font = UIFont(name: "Roboto", size: 18)
    }
    func setStyleLbl(l: UILabelX) {
        l.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        l.font = UIFont(name: "Roboto", size: 18)
        l.adjustsFontSizeToFitWidth = true
        l.minimumScaleFactor = 0.1
        l.numberOfLines = 1
    }

}
