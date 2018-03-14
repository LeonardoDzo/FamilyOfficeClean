//
//  MainInsuranceViewController.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MainInsuranceViewController: UIViewController {
    private let disposeBag = DisposeBag()
    var myCustomView = InsuranceView()
    var viewModel: MainInsuranceViewModel!
    override func loadView() {
        view = myCustomView
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()
    }
    
    func setupView() -> Void {
        self.myCustomView = InsuranceView()
        self.view = myCustomView
        self.navigationItem.leftBarButtonItem = self.backBtn
        bindToViewModel()
    }
    
    func bindToViewModel() -> Void {
        
        let input = MainInsuranceViewModel.Input(selectTrigger: self.myCustomView.collectionView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)
        
        output.selected.drive().disposed(by: disposeBag)
        
        output.insurances.drive(self.myCustomView.collectionView.rx.items(cellIdentifier: "cell", cellType: UICollectionViewCellX.self)) {
            i, model, cell in
            cell.isSelected = true
            let background = UIImageViewX()
            background.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            background.cornerRadius = 8
            cell.animation = "swing"
            cell.delay = 0.5
            background.image = model.image
            background.borderWidth = 1
            cell.backgroundView = background
            cell.animate()
        }.disposed(by: disposeBag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
