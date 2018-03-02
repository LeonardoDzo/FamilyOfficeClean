//
//  Illness+Bindible.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
protocol IllnessBindible: AnyObject {
    var illness: Illness! {get set}
    var nameLbl: UILabelX! {get}
    var detailsLbl: UILabelX! {get}
    var typebar: UIViewX! {get}
}
extension IllnessBindible {
    var nameLbl: UILabelX! {return nil}
    var detailsLbl: UILabelX! {return nil}
    var typebar: UIViewX! {return nil}
    
    func bind(illness: Illness) -> Void {
        self.illness = illness
        bind()
    }
    func bind() -> Void {
        guard let illness = illness else{
            return
        }
        
        if let view = nameLbl {
            view.text = illness.name
        }
        
        if let view = detailsLbl {
            view.text = illness.details
            view.numberOfLines = 3
            view.sizeToFit()
        }
        
        if let view = typebar {
            view.backgroundColor = illness.type.color
        }

    }
}
