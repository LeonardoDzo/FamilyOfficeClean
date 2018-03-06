//
//  InsuranceView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

final class InsuranceView: UIViewX {
    var collectionView: UICollectionView!
    convenience init(){
        self.init(frame: .zero)
        render()
    }
    
    func render() -> Void {
        confcollection()
        sv(collectionView)
        layout(
            8,
            |collectionView.height(100%)|,
            8
        )
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
    func confcollection() -> Void {
        let layout = UICollectionViewFlowLayout()
        let bounds = UIScreen.main.bounds
        let width = (bounds.size.width - 43) / 2
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: width, height: width)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsSelection = true
        
        collectionView.register(UICollectionViewCellX.self, forCellWithReuseIdentifier: "cell")
    }
}
