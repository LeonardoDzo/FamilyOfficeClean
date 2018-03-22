//
//  ProfileAssistantViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SideMenu

class ProfileAssistantViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = ProfileAssistantStevia()
    var viewModel: ProfileAsssistantViewModel!
    override func loadView() { view = v }
    override func viewDidLoad() {

        super.viewDidLoad()

        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.v = ProfileAssistantStevia()
            self.view = self.v
        }
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        v.topview.callBtn.btn.addTarget(self, action: #selector(self.call(_:)), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = self.backBtn
        bindToView()
    }
    
    func bindToView() -> Void {
        let viewWillAppear = rx.methodInvoked(#selector(self.viewWillAppear(_:)))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let input = ProfileAsssistantViewModel.Input(trigger: viewWillAppear)
        let output = viewModel.transform(input: input)
        output.assistant
            .drive(onNext: { assistant in
                self.v.topview.bind(user: assistant)
            }).disposed(by: disposeBag)
    }
    
    @objc func call(_ sender: UIButtonX) {
        if let url = URL(string: "tel://\(sender.tag)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.navigationItem.title = "Mi Asistente"
        self.tabBarController?.navigationItem.titleView = nil
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }

}
