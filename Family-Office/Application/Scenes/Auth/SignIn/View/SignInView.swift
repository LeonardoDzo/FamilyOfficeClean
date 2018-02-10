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
import GoogleSignIn
class SignInView: UIViewX {
    let email: UITextFieldX! = UITextFieldX()
    
    let password: UITextFieldX! = UITextFieldX()
    let googleBtn: GIDSignInButton! = GIDSignInButton()
    let login: UIButtonX! = UIButtonX()
    let logoImg = UIImageViewX()
    let signUpBtn = UIButtonX()
    let textLbl = UILabelX()
    
    convenience init() {
        self.init(frame:CGRect.zero)
       
        render()
    }
    
    func render() {
        sv(
            logoImg,
            email,
            password,
            login,
            signUpBtn,
            textLbl,
            googleBtn
        )
    
        logoImg.image = #imageLiteral(resourceName: "logo")
        
        logoImg.height(100).width(100).top(20%).centerHorizontally()
        email.height(60).width(80%).bottom(40%).centerHorizontally()
        password.height(60).width(80%).bottom(30%).centerHorizontally()
        
      
        textLbl.text("Aún no tienenes cuenta?")
        textLbl.height(20).width(60%).bottom(3%).left(20)
        
        
        signUpBtn.height(20).width(30%).bottom(3%).right(14%)
        signUpBtn.text("Registrate")
        signUpBtn.setTitleColor(#colorLiteral(red: 0.8554335237, green: 0.2522738874, blue: 0.4795196056, alpha: 1), for: .normal)
        
        login.height(60).width(30%).bottom(15%).centerHorizontally()
        googleBtn.height(20).width(30%).bottom(7%).centerHorizontally()
        googleBtn.colorScheme = .light
        alignVertically(login, googleBtn)
      
        email.style(self.styleTextField).style { (txt) in
            txt.placeholder = "EMAIL"
            txt.leftImage = #imageLiteral(resourceName: "icons8-gmail")
        }
        
        password.style(self.styleTextField).style { (txt) in
            txt.placeholder = "CONTRASEÑA"
            txt.isSecureTextEntry = true
            txt.leftImage = #imageLiteral(resourceName: "icons8-password")
            

        }
        login.text("Sign in")
        login.style { (btn) in
            btn.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
            btn.cornerRadius = 8
            btn.animation = "fadeInUp"
            btn.delay = 1
        }
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        animations()
    }
    
    func styleTextField(_ text: UITextFieldX) -> Void {
        text.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        text.leftPadding = 10
        text.animation = "fadeInUp"
        text.delay = 1
        
        text.font = UIFont.systemFont(ofSize: 16.0)
        text.adjustsFontSizeToFitWidth = true
        text.cornerRadius = 8
    }
}


