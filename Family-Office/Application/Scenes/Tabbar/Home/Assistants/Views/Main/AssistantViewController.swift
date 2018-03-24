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
import Stevia
import SideMenu

class AssistantViewController: UIViewController {
    private let disposeBag = DisposeBag()
    let back = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-expand_arrow"), style: .plain, target: self, action: nil)
    let editButton = UIBarButtonItem(title: "Editar", style: .plain, target: self, action: nil)
    private var isEdit = false
    var v = MainAssistantViewStevia()
    var viewModel: PendingViewModel!
    var notExistBtn = UIButtonX()
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
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
        let btns = self.v.menu.btns.enumerated().map({ i, btn in
            return btn.rx.tap.asDriver().map({i})
        }).flatMap({$0})
    
    
        
        let input = PendingViewModel.Input(trigger: Driver.merge(viewWillAppear, pull), editTrigger: editButton.rx.tap.asDriver(), backtrigger: back.rx.tap.asDriver(), gotoAddAssistant: notExistBtn.rx.tap.asDriver(), menu: btns)

        let output = viewModel.transform(input: input)

        output.pendings.drive(self.v.table.tableView.rx.items(cellIdentifier: PendingTableViewCell.reuseID, cellType: PendingTableViewCell.self)) {
            i, model, cell in
                cell.bind(pending: model)
                cell.content.bind(pending: model)
            
            }.disposed(by: disposeBag)

        output.backTrigger.drive().disposed(by: disposeBag)
        
        output.modeEdit.drive(onNext: {
            if self.v.table.tableView.isEditing {
                self.editButton.title = "Editar"
                self.v.table.tableView.setEditing(false, animated: true)
            } else {
                self.editButton.title = "Listo"
                self.v.table.tableView.setEditing(true, animated: true)
            }
            self.isEdit = !self.isEdit
        }).disposed(by: disposeBag)
        
        output.pendings.drive(onNext: {pendings in
            if pendings.isEmpty {
                let imageview = UIImageViewX()
                imageview.image = #imageLiteral(resourceName: "background_no_pendings")
                imageview.contentMode = .scaleAspectFit
                self.v.table.tableView.backgroundView = imageview
            }else{
                self.v.table.tableView.backgroundView = UIView()
            }
        }).disposed(by: disposeBag)
        
        output.btns.forEach {
            $0.drive(onNext: { i in
                self.v.changeType(i)
            }).disposed(by: disposeBag)
        }
        output.assistants.drive().disposed(by: disposeBag)
    }

}
