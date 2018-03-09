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
    var messageLbl = UILabelX()
    var bubbleView = UIImageViewX()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "Cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
           bubbleView.sv(
            messageLbl
           )
        )
        
        bubbleView.bottom(7.5).top(7.5).layout(
            2,
            |-10-messageLbl-10-| ~ (>=14),
            ""
        )
        messageLbl.centerVertically().height(>=14)
        
        messageLbl.textAlignment = .justified
        
        changeImage()
        let view = UIView()
        view.backgroundColor = UIColor.clear
    
        selectedBackgroundView = view
    }
    
    func changeImage(isFromSender: Bool? = true ) {
        let image =  isFromSender! ? #imageLiteral(resourceName: "chat_bubble_sent") : #imageLiteral(resourceName: "chat_bubble_received")
        bubbleView.image = image
            .resizableImage(withCapInsets:
                UIEdgeInsetsMake(17, 21, 17, 21),
                            resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
        
        bubbleView.tintColor =  isFromSender! ? #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1) : #colorLiteral(red: 0.8980519176, green: 0.8978511095, blue: 0.9194466472, alpha: 1)
    }
    
    
  
    
}

