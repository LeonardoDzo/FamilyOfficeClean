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

final class SearchUserView: UIViewX {
    var background = UIImageViewX()
    var tableView = UITableView()

    convenience init() {
        self.init(frame: .zero)
        render()
    }

    fileprivate func render() {
        sv(background, tableView, self.backButton)
        conftable()
        backButton.style(self.styleBtnBack)
        layout(
            0,
            |background.width(100%).height(25%)|,
            0,
            |-0-tableView.height(70%)-0-|,
            0
        )
        background.image = #imageLiteral(resourceName: "background-family")
        background.contentMode = .scaleToFill

    }

    fileprivate func conftable() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 64
        tableView.register(UserInviteTableViewCell.self, forCellReuseIdentifier: UserInviteTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
    }
}
