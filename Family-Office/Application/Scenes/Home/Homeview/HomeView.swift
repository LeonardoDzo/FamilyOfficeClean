//
//  HomeView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import RxSwift
import RxCocoa

class HomeView: UIViewX {
    var collection : UICollectionView!
    private let disposeBag = DisposeBag()
    let homeBtns = Observable.just(HomeBtn.btns)
    
    convenience init() {
        self.init(frame:CGRect.zero)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 120, height: 120)
        
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        render()
    }
    func render() -> Void {
        sv(collection)
        
        layout(
            60,
            |collection.height(100%).width(100%)|,
            40
        )
        collection.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        self.setupCellConfiguration()
    }
    
    private func setupCellConfiguration() {
        collection.register(HomeBtnCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        homeBtns
            .bind(to: collection
                .rx //2
                .items(cellIdentifier: "cell",
                       cellType: HomeBtnCollectionViewCell.self)) { // 3
                        row, model, cell in
                        cell.bind(model)
            }.disposed(by: disposeBag)
        
    }
   
}
