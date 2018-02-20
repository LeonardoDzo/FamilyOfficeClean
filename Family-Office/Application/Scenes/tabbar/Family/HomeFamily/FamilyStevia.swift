//
//  FamilyStevia.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 14/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import UIKit

class Familystevia: UIViewX {
    var label = UILabelX()
    var collectionView : UICollectionView!
    
    convenience init() {
        self.init(frame: .zero)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 160, height: 180)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(FamilyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        render()
    }
    func render() -> Void {
        sv(label, collectionView)
        label.left(10%).top(70).width(100%)
        collectionView.left(0).right(0).bottom(50).top(100).width(100%)
        label.text = "Seleccionar Familia"
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
