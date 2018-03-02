//
//  IllnessTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class IllnessTableViewCell: UITableViewCellX, IllnessBindible {
    var illness: Illness!
    var nameLbl: UILabelX! = UILabelX()
    var typebar: UIViewX! = UIViewX()
    var detailsLbl: UILabelX! = UILabelX()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            nameLbl,
            detailsLbl,
            typebar
        )
        layout(
            10,
            |-20-nameLbl.height(20)-|,
            5,
            |-20-detailsLbl.height(40)-|,
            5
        )
        typebar.left(0).top(0).height(100%).width(6)
    }

}
