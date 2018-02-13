//
//  TaskTableView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import RealmSwift

class TaskTableview: UIViewX {
    let tableView = UITableView()
    var type = 0
    var notificationToken: NotificationToken? = nil
    var rowActions: [UITableViewRowAction]!
    convenience init() {
        self.init(frame:CGRect.zero)
        
        render()
    }
    func render() {
        tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, UIScreen.main.bounds.width)
        sv(
            tableView
        )
        conftable()
        layout(
            0,
            |tableView|,
            0
        )
        let imageview = UIImageViewX()
        imageview.image = #imageLiteral(resourceName: "background_no_pendings")
        imageview.contentMode = .scaleAspectFit
        self.tableView.backgroundView = imageview
        self.tableView.tableFooterView = UIView()
    }
    fileprivate func conftable() {
        tableView.refreshControl = UIRefreshControl()
        tableView.register(PendingTableViewCell.self, forCellReuseIdentifier: PendingTableViewCell.reuseID)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.rowHeight = 100
        tableView.tableFooterView = UIView()
    }
    
}


