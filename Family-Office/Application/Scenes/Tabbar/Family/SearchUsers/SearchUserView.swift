//
//  SearchUserView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import UIKit
import CoreImage

final class SearchUserView: UIViewX {
    var background = UIImageViewX()
    var tableView = UITableView()
    var titlelbl = UILabelX()
    convenience init() {
        self.init(frame: .zero)
        render()
    }

    fileprivate func render() {
        sv(background, tableView, self.backButton, titlelbl)
        conftable()
        backButton.style(self.styleBtnBack)
        layout(
            0,
            |background.width(100%).height(25%)|,
            4,
            |-0-tableView.height(70%)-0-|,
            0
        )
        background.image = #imageLiteral(resourceName: "background-family")
        background.contentMode = .scaleToFill
        titlelbl.top(13%).centerHorizontally()
        titlelbl.textAlignment = .center
        titlelbl.font = titlelbl.font.withSize(24)
        titlelbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }

    fileprivate func conftable() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 64
        tableView.register(UserInviteTableViewCell.self, forCellReuseIdentifier: UserInviteTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
    }
    
    func styleImg(_ img:UIImageViewX) {
        let colorControl = ColorControl()
        img.style { (img) in
            colorControl.input(img.image ?? #imageLiteral(resourceName: "background_family"))
            img.contentMode = .center
            DispatchQueue.main.async {
                colorControl.contrast(0.6)
                img.image = colorControl.outputUIImage()
            }
        }
    }
}
