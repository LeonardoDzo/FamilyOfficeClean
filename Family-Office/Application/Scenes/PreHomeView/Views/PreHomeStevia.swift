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

class Prehome: UIViewX {
    private let disposeBag = DisposeBag()
    var viewModel: PreHomeViewModel!
    
    let name: UILabelX! = UILabelX()
    let email: UILabelX! = UILabelX()
    
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    func render() {
        sv(
            email,
            name
        )
        
        layout(
            100,
            |-email-| ~ 80,
            8,
            |-name-| ~ 80,
            0
        )
       
        backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        
    }
    
   
    
    func styleTextField(_ text: UITextFieldX) -> Void {
        text.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        text.leftPadding = 4
        text.font = UIFont.systemFont(ofSize: 24.0)
        text.adjustsFontSizeToFitWidth = true
    }
}
