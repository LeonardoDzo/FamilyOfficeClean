//
//  AddEditFamilyViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 02/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class AddEditFamilyViewController: UIViewController {
    private let disposeBag = DisposeBag()

    var v = AddEditFamily()
    var viewModel: AddEditViewModel!
    override func loadView() { view = v }
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func setupView() {
        self.v = AddEditFamily()
        self.view = self.v
        let input = AddEditViewModel.Input(backTrigger: v.cancelBtn.rx.tap.asDriver(), saveTrigger: self.v.saveBtn.rx.tap.asDriver(), name: self.v.nameTxt.rx.text.orEmpty.asDriver() )
        let output = viewModel.transform(input: input)
        output.back
            .drive()
            .disposed(by: disposeBag)
        output.canSave.drive(self.v.saveBtn.rx.isHidden).disposed(by: disposeBag)
        output.saved.drive().disposed(by: disposeBag)
        output.error
            .drive(self.errorBinding)
            .disposed(by: disposeBag)
        self.navigationController?.isNavigationBarHidden = true
    }
}
