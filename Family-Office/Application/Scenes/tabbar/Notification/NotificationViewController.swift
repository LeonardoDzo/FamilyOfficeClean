//
//  NotificationViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    var v = NotificationsView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = v
        self.title = "Notificaciones"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
