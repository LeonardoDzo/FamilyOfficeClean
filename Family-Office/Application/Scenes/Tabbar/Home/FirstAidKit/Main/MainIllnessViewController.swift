//
//  MainIllnessViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SideMenu

class MainIllnessViewController: UIViewController, UITabBarDelegate {
    private let disposeBag = DisposeBag()
    var v = MainIllness()
    var viewModel: MainIllnessViewModel!
    override func loadView() { // 2
        view = self.v
    }
    fileprivate func setupView() {
        self.v = MainIllness()
        self.view = self.v
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.bindToView()
        self.title = "Botiquín"
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindToView() -> Void {
        self.v.tabbar.isUserInteractionEnabled = true
        
        let willAppear = rx.sentMessage(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let search = self.v.searchBar.rx.text.changed.asDriver()
        let input = MainIllnessViewModel.Input(backTrigger: self.backBtn.rx.tap.asDriver(), taptrigger: self.v.tabbar.rx.didSelectItem.asDriver(), willAppearTrigger: willAppear, searchTrigger: search)
        let output = viewModel.transform(input: input)
        
        output.back
            .drive()
            .disposed(by: disposeBag)
        output.tap
            .drive()
            .disposed(by: disposeBag)
        output.illness.drive(self.v.tableView.rx.items(cellIdentifier: IllnessTableViewCell.reuseID, cellType:  IllnessTableViewCell.self)) {
            i, model, cell in
            self.v.tableView.backgroundView = UIViewX()
            cell.bind(illness: model)
        }.disposed(by: disposeBag)
        output.error
            .drive(self.errorBinding)
            .disposed(by: disposeBag)
        self.v.tabbar.selectedItem = self.v.tabbar.items?.first!
    }

   
}
