//
//  DetailsInsuranceViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DetailsInsuranceViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var myCustomView = DetailsInsuranceView()
    var viewModel: DetailsInsurancesViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()
        
    }
    func setupView() -> Void {
        self.myCustomView = DetailsInsuranceView()
        self.view = self.myCustomView
        self.title = viewModel.type.description
        bindToViewModel()
    }
    func bindToViewModel() -> Void {
        let willAppear = rx.methodInvoked(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        let input = DetailsInsurancesViewModel.Input(trigger: willAppear, selectedTrigger: self.myCustomView.tableView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)
        
        output.insurances.drive(self.myCustomView.tableView.rx.items(cellIdentifier: DetailsInsuranceTableViewCell.reuseID, cellType: DetailsInsuranceTableViewCell.self)) {
            i, model, cell in
            cell.bind(insurance: model)
            self.myCustomView.tableView.backgroundView = nil
        }.disposed(by: disposeBag)
        
        output.selected.drive().disposed(by: disposeBag)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

}
