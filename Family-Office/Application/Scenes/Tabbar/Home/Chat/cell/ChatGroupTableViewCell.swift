//
//  ChatGroupTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class ChatGroupTableViewCell: UITableViewCellX {
    let title = UILabelX()
    let userLbl = UILabelX()
    let container = UIViewX()
    let lastMessage = UILabelX()
    let photo = UIImageViewX()
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "Cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            photo,
            container.sv(
                title,
                userLbl,
                lastMessage
            )
        )
        photo.size(50).centerVertically()
        
        alignHorizontally(|-20-photo-container-20-|)
        align(vertically: |-title,userLbl,lastMessage-|)
        
     
    }

}
