//
//  ProfileChatViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 17/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit

class ProfileChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.title = "Info."
        self.tabBarController?.tabBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
         self.tabBarController?.tabBar.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
