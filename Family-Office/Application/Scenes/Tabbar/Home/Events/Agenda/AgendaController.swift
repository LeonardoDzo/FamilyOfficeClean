//
//  AgendaController.swift
//  Family-Office
//
//  Created by Nan Montaño on 18/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AgendaController: UITableViewController {
    var viewModel: AgendaViewModel!
    let disposeBag = DisposeBag()
    let start = BehaviorRelay(value: Date(year: 2018, month: 3))
    let end = BehaviorRelay(value: Date(year: 2018, month: 4))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = nil
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()
    }
    
    func setupView() {
        
        let input = AgendaViewModel.Input(
            start: start.asDriver(),
            end: end.asDriver()
        )
        let output = viewModel.transform(input: input)
        output.days.drive(tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { index, model, cell in
            if (model.showDate) {
                let dateText = DateFormatter.ddMMMyyyy.string(from: Date(model.item.start)!)
                cell.textLabel?.text = "\(dateText) - \(model.item.parent.summary)"
            } else {
                cell.textLabel?.text = "\(model.item.parent.summary)"
            }
        }.disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
