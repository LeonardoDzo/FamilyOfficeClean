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
    var backButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back-27x20"), style: .plain, target: self, action: #selector(goBack))
    
    override func loadView(){
        view = self.v
    }
    
    fileprivate func setupView(){
        self.v = MainSafebox()
        self.view = self.v
        self.navigationItem.leftBarButtonItem = self.backButton
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(self.changeStyle))
        self.bindToView()
        self.title = "Caja Fuerte"
    }
    
    @objc func goBack(){
        
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
        let search = self.v.searchBar.rx.text.changed.asDriver().startWith("")
        let selectPost = self.v.tableView.rx.itemSelected.asDriver().startWith(IndexPath(item: -1, section: 0))
        let selectCollection = self.v.collectionView.rx.itemSelected.asDriver().startWith(IndexPath(item: -1, section: 0))
        let back = self.backButton.rx.tap.asDriver().startWith(())
        
        self.v.tableView.allowsSelection = true
        self.v.collectionView.allowsSelection = true
        
        let input = MainSafeboxViewModel.Input(backTrigger: back, taptrigger: self.v.tabbar.rx.didSelectItem.asDriver().startWith((self.v.tabbar.items?.first!)!), willAppearTrigger: willAppear, searchTrigger: search, selectTrigger: selectPost, selectCollTrigger: selectCollection)
        
        let output = viewModel.transform(input: input)
        
        output.back.drive().disposed(by: disposeBag)
        output.tap
            .drive()
            .disposed(by: disposeBag)
        
        output.select.drive().disposed(by: disposeBag)
        
        output.safeboxAttachments.drive(self.v.tableView.rx.items(cellIdentifier: "cell", cellType: SafeboxTableViewCell.self)) {i,model,cell in
            cell.bind(attachment: model, history: self.viewModel.bc)
        }.disposed(by: disposeBag)
        
        self.v.collectionView.isUserInteractionEnabled = true
        output.safeboxAttachments.drive(self.v.collectionView.rx.items(cellIdentifier: "cell", cellType: SafeboxCollectionViewCell.self)) {i,model,cell in
            cell.isSelected = true
            cell.bind(attachment: model, history: self.viewModel.bc)
            }.disposed(by: disposeBag)
        
        output.error.drive(self.errorBinding).disposed(by: disposeBag)
        
        self.v.tabbar.selectedItem = self.v.tabbar.items?.first!
        self.v.searchBar.text = ""
    }
}
