//
//  detailsinsuranceView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

final class DetailsInsuranceView: UIViewX {
    var tableView = UITableView()
    convenience init(){
        self.init(frame: .zero)
        render()
    }
    func render() -> Void {
        sv(tableView)
        conftable()
        layout(
            8,
            |tableView.height(100%)|,
            8)
        let background = UIImageViewX()
        background.image = #imageLiteral(resourceName: "no-insurances")
        background.contentMode = .center
        tableView.backgroundView = background
    }
    
    fileprivate func conftable() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 70
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.register(DetailsInsuranceTableViewCell.self, forCellReuseIdentifier: DetailsInsuranceTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
    }
}
