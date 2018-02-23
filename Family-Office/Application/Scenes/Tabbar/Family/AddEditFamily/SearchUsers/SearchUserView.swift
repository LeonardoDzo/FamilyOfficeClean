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
    var tableView = UITableView()

    convenience init() {
        self.init(frame: .zero)
        render()
    }
    
   
    
    fileprivate func render(){
        sv(tableView)
        conftable()
        layout(
            200,
            |-0-tableView.height(70%)-0-|,
            0
        )
        backgroundColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
        
    }
    
    fileprivate func conftable() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 64
        tableView.register(UserInviteTableViewCell.self, forCellReuseIdentifier: UserInviteTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
    }
}
