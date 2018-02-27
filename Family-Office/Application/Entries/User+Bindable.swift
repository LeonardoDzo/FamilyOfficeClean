//
//  User+Bindeble.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
protocol UserBindable: AnyObject {
    var user: User! {get set}
    var nameLbl: UILabelX! {get}
    var emailLbl: UILabelX! {get}
    var phoneLbl: UILabelX! {get}
    var photoProfile: UIImageViewX! {get}
    var phoneV: InfoLineView! {get}
    var birthdayV: InfoLineView! {get}
    var bloodtypeV: InfoLineView! {get}
    var addressV: InfoLineView! {get}
    var rfcV: InfoLineView! {get}
    var nssV: InfoLineView! {get}
}
extension UserBindable {

    var nameLbl: UILabelX! {return nil}
    var emailLbl: UILabelX! {return nil}
    var photoProfile: UIImageViewX! {return nil}
    var phoneLbl: UILabelX! {return nil}
    var phoneV: InfoLineView! {return nil}
    var birthdayV: InfoLineView! {return nil}
    var bloodtypeV: InfoLineView! {return nil}
    var addressV: InfoLineView! {return nil}
    var rfcV: InfoLineView! {return nil}
    var nssV: InfoLineView! {return nil}

    func bind(user: User) {
        self.user = user
        self.bind()
    }

    func bind() {
        guard let user = user else {
            return
        }
        if let nameLbl = nameLbl {
            nameLbl.text = user.name
        }
        if let emailLbl = emailLbl {
            emailLbl.text = user.email
        }
        if let photo = photoProfile {
            if let url  = URL(string: "") {
                photo.kf.setImage(with: url)
            } else {
                photo.image = #imageLiteral(resourceName: "profile_default")
            }
        }
        if let view = self.rfcV {
            view.photo.image = #imageLiteral(resourceName: "rfc_profile")
            view.textline.text = !self.user.rfc.isEmpty ? self.user.rfc : "Sin capturar"
        }
        if let view = self.nssV {
            view.photo.image = #imageLiteral(resourceName: "nss_profile")
            view.textline.text = !self.user.nss.isEmpty ? self.user.nss : "Sin capturar"
        }
        if let view = self.bloodtypeV {
            view.photo.image = #imageLiteral(resourceName: "blood_profile")
            view.textline.text = !self.user.bloodyType.isEmpty ? self.user.bloodyType : "Sin capturar"
        }
        if let view = self.addressV {
            view.photo.image = #imageLiteral(resourceName: "location_profile")
            view.textline.text = "Sin capturar"
        }
        if let view = self.birthdayV {
            view.photo.image = #imageLiteral(resourceName: "birthday_profile")
            view.textline.text = "Sin capturar"
            if self.user.birth < 2 {
                view.textline.text = self.user.birth.toDate().string(with: .ddMMMyyyy)
            }

        }
        if let phoneLbl = self.phoneLbl {
            phoneLbl.text = self.user.phone
        }
    }
}
