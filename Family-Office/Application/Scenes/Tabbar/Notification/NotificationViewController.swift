//
//  NotificationViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxRealm

class NotificationViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var v = NotificationsView()
    var viewModel: NotificationViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = v
        self.title = "Notificaciones"
        // Do any additional setup after loading the view.
        bindToView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func bindToView() {
        let willAppear = rx.sentMessage(#selector(self.viewWillAppear(_:)))
            .asDriverOnErrorJustComplete()
            .mapToVoid()

        let input = NotificationViewModel.Input(trigger: willAppear)
        let output = self.viewModel.transform(input: input)
        
        output.solicitudes.drive(self.v.tableView.rx.items(cellIdentifier: SolicitudeTableViewCell.reuseID, cellType: SolicitudeTableViewCell.self)) {i, model, cell in
            self.v.tableView.backgroundView = nil
            cell.bind(app: model)
            }.disposed(by: disposeBag)
    }
}
