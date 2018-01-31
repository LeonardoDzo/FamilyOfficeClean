//
//  SignInView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import UIKit
import RxSwift

class SignInView: UIViewX {
    let email: UITextFieldX! = UITextFieldX()
    let password: UITextFieldX! = UITextFieldX()
    let login: UIButtonX! = UIButtonX()
    
    convenience init() {
        self.init(frame:CGRect.zero)
       
        render()
    }
    
    func render() {
        sv(
            email,
            password,
            login
        )
        
        
        layout(
            100,
            |-email-| ~ 80,
            8,
            |-password-| ~ 80,
            >=20,
            |login.width(100%)| ~ 80,
            0
            
        )
        
        email.style(self.styleTextField).style { (txt) in
            txt.placeholder = "EMAIL"
        }
        password.style(self.styleTextField).style { (txt) in
            txt.placeholder = "CONTRASEÑA"
            txt.isSecureTextEntry = true
        }
        login.text("Entrar")
        login.style { (btn) in
            btn.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        }
        backgroundColor = #colorLiteral(red: 0.9478426847, green: 0.9478426847, blue: 0.9478426847, alpha: 1)
       
    }
    
    func styleTextField(_ text: UITextFieldX) -> Void {
        text.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        text.leftPadding = 4
        text.font = UIFont.systemFont(ofSize: 24.0)
        text.adjustsFontSizeToFitWidth = true
    }
}


