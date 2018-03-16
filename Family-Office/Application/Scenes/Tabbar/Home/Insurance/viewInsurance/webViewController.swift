//
//  InsuranceAttachmentViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxWebKit

class webViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = webView()
    var viewModel: webViewViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    func setupView() -> Void {
        v = webView()
        self.view = v
        self.navigationItem.leftBarButtonItem = self.backBtn
        bindToView()
    }
    
    func bindToView() -> Void {
        let trigger = rx.methodInvoked(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let input = webViewViewModel.Input(trigger: trigger, estimateTrigger: self.v.webView.rx.estimatedProgress.asDriverOnErrorJustComplete())
        let output = viewModel.transform(input: input)
        
        output.triggerURl.drive(onNext: { url in
            if let u = url {
                self.v.webView.load(URLRequest(url: u))
            }
        }).disposed(by: disposeBag)
        output.estimateUrl.drive(viewLoading).disposed(by: disposeBag)
    }
    
    var viewLoading: Binder<Double> {
        return Binder(self, binding: { (vc, value) in
            //Do Loading
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
