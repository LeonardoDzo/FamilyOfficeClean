//
//  Insurance+Bindable.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol InsuranceBindible: AnyObject {
    var insurance: Insurance! {get set}
    var nameLbl: UILabelX! {get}
    var policyLbl: UILabelX! {get}
    var phoneBtn: UIButtonX! {get}
    
}
extension InsuranceBindible {
    var nameLbl: UILabelX! {return nil}
    var policyLbl: UILabelX! {return nil}
    var phoneBtn: UIButtonX! {return nil}
    
    func bind(insurance: Insurance) -> Void {
        self.insurance = insurance
        self.bind()
    }
    
    func bind() -> Void {
        guard let insurance = self.insurance else{
            return
        }
        
        if let view = nameLbl {
            view.text = insurance.name
        }
        if let view = policyLbl {
            view.text = insurance.policy
        }
        if let view = phoneBtn {
            view.text("Teléfono ".appending(insurance.telephone))
        }
    }
}
