//
//  ChatsTableViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit

class ChatsTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = backBtn
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        let label = UILabel()
        label.text = "No se encontro nada :("
        label.textAlignment = .center
        let font = UIFont(name: "AvenirNextCondensed-DemiBold", size: UIFont.systemFontSize)!
        label.font = font
        self.tableView.backgroundView = label
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
