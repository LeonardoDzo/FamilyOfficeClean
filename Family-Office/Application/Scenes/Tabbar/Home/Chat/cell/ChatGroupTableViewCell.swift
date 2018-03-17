//
//  ChatGroupTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 15/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia
import Kingfisher

class ChatGroupTableViewCell: UITableViewCellX, ChatBindible {
    var chat: Chat!
    let title: UILabelX! = UILabelX()
    let userLbl: UILabelX! = UILabelX()
    let dateLbl: UILabelX! = UILabelX()
    let badgeCount: UILabelX! = UILabelX()
    let container = UIViewX()
    let lastMessage: UILabelX! = UILabelX()
    let photo : UIImageViewX! = UIImageViewX()
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "Cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            photo,
            container.sv(
                title,
                userLbl,
                lastMessage,
                dateLbl,
                badgeCount
            )
        )
        photo.size(60).centerVertically()
        
        container.layout(
            >=5,
            |-title-dateLbl-|,
            2,
            alignHorizontally(|-userLbl-badgeCount-|),
            2,
            |-lastMessage-|,
            >=5
        )
        badgeCount.right(7%).size(20)
        alignHorizontally(|-20-photo-container-20-|)
        container.centerVertically()
        userLbl.font = userLbl.font.withSize(14)
        lastMessage.style(self.smallSize(_:))
        dateLbl.style(self.smallSize(_:)).style { lbl in
            lbl.textAlignment = .right
        }
    }
    
    func smallSize(_ lbl: UILabelX) -> Void {
        lbl.font = dateLbl.font.withSize(13)
        lbl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    

}
