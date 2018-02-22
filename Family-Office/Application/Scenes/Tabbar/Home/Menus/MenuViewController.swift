//
//  MenuViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxRealm
import RxCocoa
class MenuViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = MenuView()
    var viewModel: MenuViewModel!
    
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Familias"
        on("INJECTION_BUNDLE_NOTIFICATION") {
             self.v = MenuView()
             self.view = self.v
        }
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = MenuViewModel.Input(trigger: viewWillAppear, triggerSelected: self.v.tableView.rx.itemSelected.asDriver(), triggerLogout: self.v.logoutBtn.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.families.drive(self.v.tableView.rx.items(cellIdentifier: FamilyTableViewCell.reuseID, cellType: FamilyTableViewCell.self)){tv,model,cell in
            cell.isSelected = false
            cell.bind(family: model)
            }.disposed(by: disposeBag)
        
        output.logout.drive().disposed(by: disposeBag)
        output.selected.drive().disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
