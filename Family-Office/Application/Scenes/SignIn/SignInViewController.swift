//
//  SignInViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class SignInViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = SignInView()
    var viewModel: SignInviewModel!
    override func loadView() { view = v }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.v = SignInView()
            self.view = self.v
            self.bindViewModel()
        }
        self.navigationController?.isNavigationBarHidden = true
        self.bindViewModel()
        // Do any additional setup after loading the view.
    }
    
    func bindViewModel() -> Void {
        let input = SignInviewModel.Input(signUpTrigger: v.signUpBtn.rx.tap.asDriver(), loginTrigger: v.login.rx.tap.asDriver(), email: v.email.rx.text.orEmpty.asDriver(), password: v.password.rx.text.orEmpty.asDriver())
        let output = viewModel.transform(input: input)
        
        output.dismiss
            .drive()
            .disposed(by: disposeBag)
        output.loginEnabled
            .drive(v.login.rx.isEnabled)
            .disposed(by: disposeBag)
        output.signUp
            .drive()
            .disposed(by: disposeBag)
        output.error
            .drive(self.errorBinding)
            .disposed(by: disposeBag)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
