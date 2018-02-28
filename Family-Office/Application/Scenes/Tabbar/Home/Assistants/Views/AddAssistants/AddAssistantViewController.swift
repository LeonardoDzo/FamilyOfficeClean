//
//  AddAssistantViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
class AddAssistantViewController: UIViewController {
    private var disposeBag = DisposeBag()
    var v = SearchUserView()
    var viewModel: AddAssistantViewModel!
    fileprivate func setupView() {
        self.v = SearchUserView()
        v.background.image = #imageLiteral(resourceName: "Blog_Admin_Assistant")
        v.background.contentMode = .scaleAspectFill
        v.background.style(v.styleImg)
        v.titlelbl.text = "Encuentra tu asistente"
        v.titlelbl.sizeToFit()
        
        self.navigationController?.isNavigationBarHidden = true
        self.v.tableView.register(AssistantInviteTableViewCell.self, forCellReuseIdentifier: AssistantInviteTableViewCell.reuseID)
        self.view = v
        self.bindToView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        setupView()
    }
    
    func bindToView() -> Void {
        let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewDidAppear(_:)))
            .mapToVoid()
            .asDriverOnErrorJustComplete()
        let input = AddAssistantViewModel.Input(trigger: viewWillAppear, back: self.v.backButton.rx.tap.asDriver())
        let output = viewModel.transform(input: input)
        
        output.assistants.drive(self.v.tableView.rx.items(cellIdentifier: AssistantInviteTableViewCell.reuseID, cellType: AssistantInviteTableViewCell.self)) {
            i,model,cell in
            cell.bind(user: model)
            cell.bindInviteBtn(isInvited: false)
        }.disposed(by: disposeBag)
        output.back.drive().disposed(by: disposeBag)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
