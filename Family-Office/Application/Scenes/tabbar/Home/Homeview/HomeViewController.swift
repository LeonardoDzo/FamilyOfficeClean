//
//  HomeViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import SideMenu
import RxCocoa
import RxSwift

class HomeViewController: UIViewController, UICollectionViewDelegate {
    private let disposeBag = DisposeBag()
    var v = HomeView()
    var menuBtn = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-list").maskWithColor(color: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), style: .plain, target: self, action: nil)
    var viewModel: HomeViewmodel!
    override func loadView() { view = v }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        self.navigationItem.leftBarButtonItem = menuBtn
        self.setupView()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    fileprivate func setupView(){
       
        self.v.collection.isUserInteractionEnabled = true
        let input = HomeViewmodel.Input(menuTrigger: menuBtn.rx.tap.asDriver(), selectTrigger: self.v.collection.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)
        self.navigationController?.isNavigationBarHidden = false
        
        output.selected.drive().disposed(by: disposeBag)
        
        output.menu.drive(onNext: {_ in
            self.present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
        }).disposed(by: disposeBag)
        
        output.homeBtns.drive(self.v.collection.rx.items(cellIdentifier: "cell", cellType: HomeBtnCollectionViewCell.self)){ // 3
            row, model, cell in
            cell.isSelected = true
            cell.bind(model)
            }.disposed(by: disposeBag)
    }
}
