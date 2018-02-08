//
//  Family+Bindeble.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
protocol FamilyBindeble: AnyObject {
    var family: Family! {get set}
    var titleLbl: UILabelX! {get}
    var photo: UIImageViewX! {get}
}
extension FamilyBindeble {
    var titleLbl: UILabelX! {return nil}
    var photo: UIImageViewX! {return nil}
    
    func bind(family: Family) -> Void {
        self.family = family
        self.bind()
    }
    
    func bind() -> Void {
        guard let family = family else {
            return
        }
        if let titlelbl = titleLbl {
            titlelbl.text = family.name
        }
        if let photo = photo {
            photo.image = #imageLiteral(resourceName: "icons8-family")
        }
    }
}
