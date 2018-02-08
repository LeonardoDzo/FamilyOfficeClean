//
//  PreHomeViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxRealm
import RxCocoa
class PreHomeViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var viewModel: PreHomeViewModel!
    var v = Prehome()
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
       self.setupView()
    }
    fileprivate func setupView(){
        
        self.v = Prehome()
        self.view = self.v

        let input = PreHomeViewModel.Input(selection: self.v.tableView.rx.itemSelected.asDriver(), createBtntrigger: self.v.creteFamilybtn.rx.tap.asDriver())
        let output = self.viewModel.transform(input: input)
        output.user.drive(self.userBinding).disposed(by: self.disposeBag)
        output.create
            .drive()
            .disposed(by: disposeBag)
        
        output.families.drive(self.v.tableView.rx.items(cellIdentifier: FamilyTableViewCell.reuseID, cellType: FamilyTableViewCell.self)){tv,model,cell in
            cell.bind(family: model)
        }.disposed(by: disposeBag)
        output.selectedFamily.drive().disposed(by: disposeBag)
        self.navigationController?.isNavigationBarHidden = true
    }
    
  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var userBinding: Binder<User> {
        return Binder(self, binding: { (vc, user) in
            vc.v.bind(user: user)
            
        })
    }
}
