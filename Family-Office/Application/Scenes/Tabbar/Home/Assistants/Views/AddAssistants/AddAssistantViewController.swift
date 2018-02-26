//
//  AddAssistantViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class AddAssistantViewController: UIViewController {
    private var disposeBag = DisposeBag()
    var v = SearchUserView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        v.background.image = #imageLiteral(resourceName: "Blog_Admin_Assistant")
        self.view = v
        //bindToModel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
