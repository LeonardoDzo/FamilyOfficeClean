//
//  SearchUsersViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchUsersViewController: UIViewController {
    private var disposeBag = DisposeBag()
    var v = SearchUserView()
    var viewModel: SearchUserViewModel!
    let backBt = UIBarButtonItem(image: #imageLiteral(resourceName: "back-27x20"), style: .plain, target: self, action: nil)
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = v
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
        self.navigationItem.leftBarButtonItem = self.backBt
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        bindToModel()
    }
    
    func bindToModel(){
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = SearchUserViewModel.Input(trigger: viewWillAppear, backTrigger: self.backBt.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        output.users.drive(self.v.tableView.rx.items(cellIdentifier: UserInviteTableViewCell.reuseID, cellType: UserInviteTableViewCell.self)){
                i, model, cell in
            cell.bind(user: model)
            }
            .disposed(by: disposeBag)
        output.back.drive().disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
