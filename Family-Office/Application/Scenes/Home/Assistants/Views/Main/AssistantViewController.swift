//
//  AssistantViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit

class AssistantViewController: UIViewController {
    var v = MainAssistantViewStevia()
    
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setNavbar() {
        self.tabBarController?.navigationItem.titleView = nil
        self.tabBarController?.navigationItem.title = nil
        self.tabBarController?.navigationItem.title = "Peticiones"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
