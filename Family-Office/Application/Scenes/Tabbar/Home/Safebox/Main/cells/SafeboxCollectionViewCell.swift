//
//  SafeboxCollectionViewCell.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class SafeboxCollectionViewCell: UICollectionViewCellX, SafeboxBindable {
    var attachment: SafeboxAttachment!
    var nameLbl: UILabelX! = UILabelX()
    var iconImgView: UIImageViewX! = UIImageViewX()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sv(iconImgView, nameLbl)
        
        layout(
            5,
            |-10-iconImgView.height(30).width(30)-|,
            5,
            |-2-nameLbl.height(8).width(100%)-2-|,
            5
        )
    }
    
    
    
}
