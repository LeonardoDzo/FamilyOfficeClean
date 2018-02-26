//
//  MenuView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class MenuView: UIViewX {
    var tableView = UITableView()
    var logoutBtn = UIButtonX()

    convenience init() {
        self.init(frame: .zero)
        render()
    }
    fileprivate func render() {
        sv(tableView, logoutBtn)
        conftable()
        layout(
            20,
            |tableView.width(100%).height(80%)|,
            ""
        )

        tableView.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)

        logoutBtn.text("Cerrar sesión")
        logoutBtn.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        logoutBtn.bottom(2%).width(100%).height(30)

    }
    fileprivate func conftable() {
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 64
        tableView.register(FamilyTableViewCell.self, forCellReuseIdentifier: FamilyTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
    }
}
