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
import GoogleSignIn

class SignInViewController: UIViewController, GIDSignInUIDelegate {
    private let disposeBag = DisposeBag()
    var v = SignInView()
    var viewModel: SignInviewModel!
    override func loadView() { view = v }

    override func viewDidLoad() {
        super.viewDidLoad()

        GIDSignIn.sharedInstance().uiDelegate = self
        self.v = SignInView()
        self.view = self.v
        self.view.endEditing(true)
        self.navigationController?.isNavigationBarHidden = true

        self.bindViewModel()
        // Do any additional setup after loading the view.
    }

    func bindViewModel() {
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
        output.emailpass
            .drive(self.emailPassBinding)
            .disposed(by: disposeBag)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var emailPassBinding: Binder<(String, String)> {
        return Binder(self, binding: { (vc, e) in
            vc.v.email.text = e.0
            vc.v.password.text = e.1

        })
    }

}
extension SignInViewController {

    // pressed the Sign In button
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {

    }

    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }

    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
}
