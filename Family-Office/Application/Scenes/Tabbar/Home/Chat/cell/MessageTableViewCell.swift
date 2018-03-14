//
//  MessageTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class MessageTableViewCell: UITableViewCellX, MessageBindible {
    var message: MockMessage!
    var messageText: UILabelX! = UILabelX()
    var date: UILabelX! = UILabelX()
    var nameSender: UILabelX! = UILabelX()
    var photoMessage: UIImageViewX! = UIImageViewX()
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
            messageText,
            photoMessage,
            date,
            nameSender
           )
        )
        
        bubbleView.bottom(7.5).top(7.5).layout(
            5,
            |-10-nameSender.height(12),
            1,
            |-10-photoMessage-10-|,
            0,
            |-10-messageText-10-| ~ (>=14),
            1,
            date.height(10)-15-|,
            5,
            ""
        )
        messageText.centerVertically()
        date.bottom(1)
        let view = UIView()
        view.backgroundColor = UIColor.clear
        selectedBackgroundView = view
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        animation = "fadeInUp"
        animate()
    }
    
    func changeImage(isFromSender: Bool? = true ) {
        let image =  isFromSender! ? #imageLiteral(resourceName: "chat_bubble_sent") : #imageLiteral(resourceName: "chat_bubble_received")
        bubbleView.image = image
            .resizableImage(withCapInsets:
                UIEdgeInsetsMake(17, 21, 17, 21),
                            resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
        
        bubbleView.tintColor =  isFromSender! ? #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1) : #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
    }
    
    
  
    
}

