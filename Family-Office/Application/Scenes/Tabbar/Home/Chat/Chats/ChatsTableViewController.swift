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
    
    let disposeBag = DisposeBag()
    
    var viewwModel: ChatsViewmodel!
    
    fileprivate func setupView() {
        self.navigationItem.leftBarButtonItem = backBtn
        self.tableView.register(ChatGroupTableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.tableFooterView = UIView()
        self.tableView.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        self.tableView.dataSource = nil
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
        let input = ChatsViewmodel.Input(willAppearTriger: willAppear, selectTrigger: self.tableView.rx.itemSelected.asDriver())
        let output = viewwModel.transform(input: input)
        
        output.chats.drive(self.tableView.rx.items(cellIdentifier: "cell", cellType: ChatGroupTableViewCell.self)){
            i, model, cell in
           
            if (model.group?.name.isEmpty)! && model.family == nil{
                 let user = model.members.first(where: {$0.user?.uid != me})?.user
                 cell.title.text = user?.displayName ?? "🥊"
            }else{
                let name = model.family == nil ? model.group?.name : model.family?.name
                cell.title.text = name
                
            }
            cell.photo.image = #imageLiteral(resourceName: "background-Assitant")
           
        }.disposed(by: disposeBag)
        
        output.selected.drive().disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
