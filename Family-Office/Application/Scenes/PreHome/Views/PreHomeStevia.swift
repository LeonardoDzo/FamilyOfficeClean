//
//  PreHomeStevia.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import RxCocoa
import RxSwift

class Prehome: UIViewX, UserBindeble {
    var user: User!
    
    var topContent: UIImageViewX = UIImageViewX()
    var photoProfile: UIImageViewX = UIImageViewX()
    var nameLbl: UILabelX! = UILabelX()
    var emailLbl: UILabelX! = UILabelX()
    var settingBtn = UIButtonX()
    var logoutBtn = UIButtonX()
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        sv(
            topContent,
            emailLbl,
            photoProfile,
            nameLbl,
            settingBtn,
            logoutBtn
        )
       
        layout(
            0,
            |topContent.height(300).width(100%)|,
            0,
            ""
        )
        
        topContent.layout(
            70,
            nameLbl.height(20).width(100%),
            5,
            emailLbl.height(20).width(100%),
            40,
            photoProfile,
            0,
            ""
        )
        
        settingBtn.top(240).left(15%)
        logoutBtn.top(240).right(15%)
        topContent.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        topContent.image = #imageLiteral(resourceName: "background_profile")
        topContent.contentMode = .scaleToFill
        photoProfile.width(100).height(100)
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        photoProfile.image = #imageLiteral(resourceName: "profile_default")
        settingBtn.style(self.styleBtn).style({ (btn) in
            btn.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        })
        logoutBtn.style(self.styleBtn).style { (btn) in
            btn.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        }
        logoutBtn.style(self.styleBtn)
        photoProfile.centerHorizontally()
        emailLbl.style(self.styleTextField)
        nameLbl.style(self.styleTextField)
        photoProfile.style(self.styleImg)
        
    }
    func styleImg(_ img: UIImageViewX) -> Void {
        img.clipsToBounds = true
        img.cornerRadius = 50
        img.borderColor = borderColor
        img.borderWidth = 1
        img.animation = "fadeIn"
        img.duration = 3
        img.animate()
    }
    
    func styleBtn(_ btn: UIButtonX) -> Void {
        btn.width(40).height(40)
        btn.animation = "pop"
        btn.delay = 1
        btn.animate()
    }

    func styleTextField(_ text: UILabelX) -> Void {
        text.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        text.height(20)
        text.font = UIFont.systemFont(ofSize: 18.0)
        text.adjustsFontSizeToFitWidth = true
        text.centerHorizontally()
        text.textAlignment = .center
    }
}

