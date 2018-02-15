//
//  AssistantViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AssistantViewController: UIViewController {
    private let disposeBag = DisposeBag()
    let back = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-expand_arrow"), style: .plain, target: self, action: nil)
    let editButton = UIBarButtonItem(title: "Editar", style: .plain, target: self, action:nil)
    private var isEdit = false
    var v = MainAssistantViewStevia()
    var viewModel: PendingViewModel!
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar()
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate func setNavbar() {
        self.navigationItem.leftBarButtonItem = back
        self.navigationItem.rightBarButtonItem = editButton
        self.navigationItem.title = "Peticiones"
    }

    private func bindViewModel() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:))).mapToVoid().asDriverOnErrorJustComplete()
        let pull = self.v.table.tableView.refreshControl!.rx
            .controlEvent(.valueChanged)
            .asDriver()
        let input = PendingViewModel.Input(trigger: Driver.merge(viewWillAppear, pull), editTrigger: editButton.rx.tap.asDriver(), backtrigger: back.rx.tap.asDriver())

        let output = viewModel.transform(input: input)
        
        output.pendings.drive(self.v.table.tableView.rx.items(cellIdentifier: PendingTableViewCell.reuseID, cellType: PendingTableViewCell.self)){
            i,model,cell in
                cell.bind(pending: model)
                cell.content.bind(pending: model)
            
            }.disposed(by: disposeBag)
  
        output.backTrigger.drive().disposed(by: disposeBag)
        output.modeEdit.drive(onNext: {
            if self.isEdit {
                self.editButton.title = "Listo"
                self.v.table.tableView.setEditing(true, animated: true)
            }else{
                self.editButton.title = "Editar"
                self.v.table.tableView.setEditing(false, animated: true)
            }
            self.isEdit = !self.isEdit
        }).disposed(by: disposeBag)
    }
    
}
