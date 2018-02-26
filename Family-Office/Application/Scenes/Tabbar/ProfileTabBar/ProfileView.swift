//
//  ProfileView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class ProfileView: UIViewX, UserBindable {
    var user: User!
    let menu = MenuMainAss(total: ["Acerca de", "Familias", "Eventos"])
    let backgroundImg: UIImageViewX = UIImageViewX()
    var photoProfile: UIImageViewX! = UIImageViewX()
    var nameLbl: UILabelX! = UILabelX()
    var rfcV: InfoLineView! = InfoLineView()
    var nssV: InfoLineView! = InfoLineView()
    var addressV: InfoLineView! = InfoLineView()
    var bloodtypeV: InfoLineView! = InfoLineView()
    //Buttons
    var callBtn = UIButtonX()
    var chatBtn = UIButtonX()
    var settingBtn = UIButtonX()

    convenience init() {
        self.init(frame: .zero)
        render()
        self.bind()
    }
    fileprivate func stylePhotoProfile(_ photo: UIImageViewX) {
        photo.image = #imageLiteral(resourceName: "profile_default").maskWithColor(color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        photo.width(100).height(100).top(10%).centerHorizontally()
        photo.cornerRadius = 50
        photo.clipsToBounds = true
        photo.animation = "fadeInDown"
        photo.delay = 0.5
    }

    fileprivate func render() {
        sv(backgroundImg, photoProfile, nameLbl, addressV, bloodtypeV, nssV, rfcV, menu, backButton)
        backButton.style(self.styleBtnBack)
        // Layout
        layout(
            0,
            |-0-backgroundImg.width(100%).height(40%)-0-|,
            0,
            |-0-menu.width(100%)-0-| ~ 60,
            2,
            |-0-nssV.width(100%)-0-| ~ 60,
            0,
            |-0-rfcV.width(100%)-0-| ~ 60,
            0,
            |-0-addressV.width(100%)-0-| ~ 60,
            0,
            |-0-bloodtypeV.width(100%)-0-| ~ 60,
            ""
        )

        for view in self.subviews {
            if let v = view as? InfoLineView {
                v.animation = "squeezeLeft"
                v.curve = "easeIn"
            }
        }

        backgroundImg.image = #imageLiteral(resourceName: "background-profile")
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        photoProfile.style(self.stylePhotoProfile)

        nameLbl.height(20).width(80%).top(30%).centerHorizontally()
        nameLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        nameLbl.font = nameLbl.font.withSize(24)
        nameLbl.textAlignment = .center
        nameLbl.animation = "fadeInDown"
        self.animations()
    }

}
