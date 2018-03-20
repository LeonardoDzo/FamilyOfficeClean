//
//  MainEventsViewController.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

struct MonthData {
    let items: [EventInstance]
    let month: Date
}

class MainEventsViewController: UICollectionViewController {
    private let disposeBag = DisposeBag()
    var viewModel: MainEventsViewModel!
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.setupView()
        }
        self.setupView()
    }
    
    func setupView() {
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        
        // view
        self.navigationItem.leftBarButtonItem = self.backBtn
        self.navigationItem.rightBarButtonItem = addButton
        self.collectionView!.dataSource = nil
        self.collectionView?.delegate = self
        self.collectionView?.register(CalendarMonthCell.self, forCellWithReuseIdentifier: "cell")
        self.collectionView?.backgroundColor = UIColor.white
        
        // model
        let willAppear = rx.methodInvoked(#selector(self.viewWillAppear))
            .asDriverOnErrorJustComplete()
            .mapToVoid()
        
        let itemSelected = collectionView?.rx.itemSelected
            .asDriver()
        
        let input = MainEventsViewModel.Input(
            willAppear: willAppear,
            newEvent: addButton.rx.tap.asDriver(),
            itemSelected: itemSelected!
        )
        
        let output = viewModel.transform(input: input)
        
       output.months.drive(self.collectionView!.rx.items(cellIdentifier: "cell", cellType: CalendarMonthCell.self)) { index, model, cell in
            let end = model.month.add(months: 1, days: -1)
            cell.bind(events: model.items, start: model.month, end: end)
        }.disposed(by: disposeBag)
        output.tapped.drive().disposed(by: disposeBag)
        output.select.drive().disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension MainEventsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 25) / 3
        let height = (collectionView.bounds.size.height - 70) / 4
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
