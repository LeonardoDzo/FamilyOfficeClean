//
//  MessageTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class MessageTableViewCell: UITableViewCell {
    var messageLbl = UITextView()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "Cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            messageLbl.style(self.stylemessage)
        )
        
        layout(
            2,
            |messageLbl|,
            ""
        )
        
    }

    func stylemessage(_ m: UITextView) -> Void {
        m.font = UIFont.systemFont(ofSize: 16)
    }
}
