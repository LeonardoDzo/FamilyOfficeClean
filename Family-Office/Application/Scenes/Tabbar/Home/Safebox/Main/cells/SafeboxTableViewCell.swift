//
//  SafeboxTableViewCell.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 16/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class SafeboxTableViewCell: UITableViewCellX, SafeboxBindable {
    var attachment: SafeboxAttachment!
    var nameLbl: UILabelX! = UILabelX()
    var iconImgView: UIImageViewX! = UIImageViewX()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(nameLbl, iconImgView)
        iconImgView.width(30).height(30)
        iconImgView.contentMode = UIViewContentMode.scaleAspectFit
        
        layout(
            7,
            |-5-iconImgView-10-nameLbl-5-|,
            7
        )
    }
}
