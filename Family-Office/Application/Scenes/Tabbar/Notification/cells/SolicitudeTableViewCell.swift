//
//  SolicitudeTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class SolicitudeTableViewCell: UITableViewCell {
    var details = UILabelX()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        sv(
            details
        )
        details.text = "ITS WORKS"
        details.width(100%).height(30).centerVertically()
    }

}
