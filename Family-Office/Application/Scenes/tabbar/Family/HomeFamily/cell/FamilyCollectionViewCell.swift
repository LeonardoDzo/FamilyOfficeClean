//
//  FamilyCollectionViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 14/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class FamilyCollectionViewCell: UICollectionViewCell, FamilyBindable {
    var family: Family!
    var titleLbl: UILabelX! = UILabelX()
    var photo: UIImageViewX! = UIImageViewX()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
    }
    func render() -> Void {
        sv(titleLbl, photo)
        layout(4,
               |-4-photo.width(100%).height(80%)-4-|,
               2,
               titleLbl.width(100%).height(20),
               4)
       
        titleLbl.centerHorizontally()
        titleLbl.textAlignment = .center
    }
    func bind() {
        photo.backgroundColor = UIColor.clear
        self.photo.image = #imageLiteral(resourceName: "add")
        self.photo.borderWidth = 1
        self.photo.borderColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        self.photo.cornerRadius = 8
        self.photo.contentMode = .center
        self.titleLbl.text = "Agregar familia"
        
    }
}
