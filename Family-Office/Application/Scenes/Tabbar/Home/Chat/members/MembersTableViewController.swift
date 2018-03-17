//
//  MembersTableViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MembersTableViewController: UITableViewController {
    private let disposeBag = DisposeBag()
    var viewModel: MembersChatViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()
    }
    func setupView() -> Void {
        tableView.register(MemberChatTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        self.tableView.dataSource = nil
        self.tableView.tableFooterView = UIView()
        self.title = "Miembros"
    
        self.navigationItem.leftBarButtonItem = self.backBtn
        bindToView()
    }
  
    func bindToView() -> Void {
        let willAppear = rx.sentMessage(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let input = MembersChatViewModel.Input(appearTrigger: willAppear, selectUserTrigger: self.tableView.rx.itemSelected.asDriver())
   
        let output = viewModel.transform(input: input)
        
        output.users.drive(self.tableView.rx.items(cellIdentifier: "cell", cellType: MemberChatTableViewCell.self)) {
            i, model, cell in
            cell.bind(user: model)
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.clear
            cell.selectedBackgroundView = backgroundView
        
           
        }.disposed(by: disposeBag)
        
        output.selected
            .drive()
            .disposed(by: disposeBag)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
