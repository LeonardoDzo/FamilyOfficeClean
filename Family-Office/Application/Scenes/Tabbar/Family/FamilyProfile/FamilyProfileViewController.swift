//
//  FamilyViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SideMenu
class FamilyProfileViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = FamilyProfileView()
    var viewModel: FamilyProfileViewModel!
    override func loadView() { // 2
        view = self.v
    }

    fileprivate func setupView() {
        self.v = FamilyProfileView()
        self.view = self.v
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        bindToView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
          self.setupView()
        }
        self.setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    func bindToView() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()

        let input = FamilyProfileViewModel.Input(familyTrigger: viewWillAppear, tapAddMemberTrigger: self.v.addMemberBtn.rx.tap.asDriver(), backtrigger: self.v.backButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)

        output.back.drive().disposed(by: disposeBag)
        output.family
            .drive(onNext: { family in
                self.v.bind(family: family)
            })
            .disposed(by: disposeBag)

        output.members.drive(self.v.tableView.rx.items(cellIdentifier: FamilyMemberTableViewCell.reuseID, cellType: FamilyMemberTableViewCell.self)) {
            i, model, cell in
            cell.bind(user: model)
        }.disposed(by: disposeBag)

        output.tapAddMember
            .drive()
            .disposed(by: disposeBag)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
