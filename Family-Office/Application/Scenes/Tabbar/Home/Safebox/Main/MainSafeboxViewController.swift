//
//  MainSafeboxViewController.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import SideMenu

class MainSafeboxViewController: UIViewController, UITabBarDelegate {
    private let disposeBag = DisposeBag()
    var v = MainSafebox()
    var currentFolder = ["root"]
    var viewModel: MainSafeboxViewModel!
    
    override func loadView(){
        view = self.v
    }
    
    fileprivate func setupView(){
        self.v = MainSafebox()
        self.view = self.v
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(self.changeStyle))
        self.bindToView()
        self.title = "Caja Fuerte"
    }
    
    @objc func changeStyle(){
        self.v.collectionView.isHidden = !self.v.collectionView.isHidden
        self.v.tableView.isHidden = !self.v.tableView.isHidden
        self.view = self.v
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION"){
            self.setupView()
        }
        self.setupView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func bindToView() -> Void {
        self.v.tabbar.isUserInteractionEnabled = true
        
        let willAppear = rx.sentMessage(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let search = self.v.searchBar.rx.text.changed.asDriver()
        let selectPost = self.v.tableView.rx.itemSelected.asDriver()
        
        self.v.tableView.allowsSelection = true
        
        let input = MainSafeboxViewModel.Input(backTrigger: self.backBtn.rx.tap.asDriver(), taptrigger: self.v.tabbar.rx.didSelectItem.asDriver(), willAppearTrigger: willAppear, searchTrigger: search, selectTrigger: selectPost)
        
        let output = viewModel.transform(input: input)
        
        output.back.drive().disposed(by: disposeBag)
        output.tap
            .drive()
            .disposed(by: disposeBag)
        
        output.select.drive().disposed(by: disposeBag)
        
        output.safeboxAttachments.drive(self.v.tableView.rx.items(cellIdentifier: "cell", cellType: SafeboxTableViewCell.self)) {i,model,cell in
            cell.bind(attachment: model)
        }.disposed(by: disposeBag)
        
        output.safeboxAttachments.drive(self.v.collectionView.rx.items(cellIdentifier: "cell", cellType: SafeboxCollectionViewCell.self)) {i,model,cell in
            cell.bind(attachment: model)
            }.disposed(by: disposeBag)
        
        output.error.drive(self.errorBinding).disposed(by: disposeBag)
        
        self.v.tabbar.selectedItem = self.v.tabbar.items?.first!
        self.v.searchBar.text = ""
    }
}
