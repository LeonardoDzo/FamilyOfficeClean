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
    var collection: UICollectionView!
    private let disposeBag = DisposeBag()
    let homeBtns = Observable.just(HomeBtn.btns)

    convenience init() {
        self.init(frame: CGRect.zero)
        
    
        render()
    }
    func render() {
        self.setupCellConfiguration()
        sv(collection)
        layout(
            60,
            |collection.height(100%).width(100%)|,
            40
        )
        collection.backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        
    }

    private func setupCellConfiguration() {
        let layout = UICollectionViewFlowLayout()
        let bounds = UIScreen.main.bounds
        let width = (bounds.size.width - 43) / 3
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: width, height: width)
        
        collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.allowsSelection = true
        collection.register(HomeBtnCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }

}
