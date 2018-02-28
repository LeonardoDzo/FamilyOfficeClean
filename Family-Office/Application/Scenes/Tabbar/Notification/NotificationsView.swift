//
//  NotificationsView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
class NotificationsView: UIViewX {
    var tableView = UITableView()
    convenience init() {
        self.init(frame: .zero)
        render()
    }
    func render() {
        sv(tableView)
        tableView.tableFooterView = UIView()
        tableView.width(100%).height(100%)
        conftable()
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let imageView = UIImageViewX()
        imageView.image = #imageLiteral(resourceName: "background_no_notifications")
        self.tableView.backgroundView = imageView
        imageView.contentMode = .scaleAspectFit
    }

    fileprivate func conftable() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 100
        tableView.register(SolicitudeTableViewCell.self, forCellReuseIdentifier: SolicitudeTableViewCell.reuseID)

        tableView.tableFooterView = UIView()
    }
}
