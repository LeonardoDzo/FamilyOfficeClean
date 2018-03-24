//
//  ChatsTableViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class ChatsTableViewController: UITableViewController {
    
    var disposeBag = DisposeBag()
    let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    var viewwModel: ChatsViewmodel!
    
    fileprivate func setupView() {
        self.navigationItem.leftBarButtonItem = backBtn
        self.tableView.register(ChatGroupTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 80
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        self.tableView.separatorInset = UIEdgeInsets(top: 0, left: 80, bottom: 0, right: 0)
        self.tableView.dataSource = nil
        self.navigationItem.rightBarButtonItem = add
        let label = UILabel()
        label.text = "No se encontro nada :("
        label.textAlignment = .center
        let font = UIFont(name: "AvenirNextCondensed-DemiBold", size: UIFont.systemFontSize)!
        label.font = font
        self.tableView.backgroundView = label
        bindToView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func bindToView() -> Void {
        let willAppear = rx.sentMessage(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let input = ChatsViewmodel.Input(willAppearTriger: willAppear, addTrigger: add.rx.tap.asDriver(), selectTrigger: self.tableView.rx.itemSelected.asDriver())
        let output = viewwModel.transform(input: input)
        
        output.chats.drive(self.tableView.rx.items(cellIdentifier: "cell", cellType: ChatGroupTableViewCell.self)){
            i, model, cell in
            cell.bind(chat: model)
            self.tableView.backgroundView = nil
        }.disposed(by: disposeBag)
        output.addTapped.drive().disposed(by: disposeBag)
        output.selected.drive().disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
