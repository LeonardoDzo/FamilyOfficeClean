//
//  Family+Bindeble.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

protocol FamilyBindable: AnyObject {
    var family: Family! {get set}
    var titleLbl: UILabelX! {get}
    var photo: UIImageViewX! {get}
    var selectedPhoto: UIImageViewX! {get}
}
extension FamilyBindable {
    var titleLbl: UILabelX! {return nil}
    var photo: UIImageViewX! {return nil}
    var selectedPhoto: UIImageViewX! {return nil}

    func bind(family: Family) {
        self.family = family
        self.bind()
    }

    func bind() {
        guard let family = family else {
            return
        }
        if let titlelbl = titleLbl {
            titlelbl.text = family.name
        }
        if let view = photo {
            let token = UserDefaults().value(forKey: "token") as? String ?? ""
            var urlstring = family.photo?.routes[1] ?? ""
            urlstring.append("?token=\(token)")
            let url = URL(string: urlstring)
            view.contentMode = .scaleAspectFill
            view.kf.indicatorType = .activity
            view.clipsToBounds = true
            let processor = RoundCornerImageProcessor(cornerRadius: 8)
            view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "family-default"), options: [.transition(.fade(0.2)), .processor(processor)])
        }

        if let selectedPhoto  = selectedPhoto {
            selectedPhoto.image = #imageLiteral(resourceName: "check-1")
            selectedPhoto.isHidden = self.family.isSelected ? false : true
        }
    }
}
