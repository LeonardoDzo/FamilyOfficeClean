//
//  ProfileViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProfileViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var viewModel: ProfileViewModel!
    var v = ProfileView()
    override func loadView() { view = v }

    fileprivate func setupView() {
        v = ProfileView()
        self.view = v
        self.view.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        self.bindtoView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()

    }
    func bindtoView() {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = ProfileViewModel.Input(trigger: viewWillAppear, backTrigger: self.v.backButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)

        output.back.drive().disposed(by: disposeBag)
        output.user.drive(onNext: { user in
            self.v.bind(user: user)
        }).disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

}