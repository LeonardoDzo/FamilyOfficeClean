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
protocol UserBindeble: AnyObject {
    var user: User! {get set}
    var nameLbl: UILabelX! {get}
    var emailLbl: UILabelX! {get}
    var photoProfile: UIImageViewX! {get}
}
extension UserBindeble {
    var nameLbl: UILabelX! {return nil}
    var emailLbl: UILabelX! {return nil}
    var photoProfile: UIImageViewX! {return nil}
    
    func bind(user: User) -> Void {
        self.user = user
        self.bind()
    }
    
    func bind() -> Void {
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
            }else{
                photo.image = #imageLiteral(resourceName: "profile_default")
            }
            
        }
    }
}
