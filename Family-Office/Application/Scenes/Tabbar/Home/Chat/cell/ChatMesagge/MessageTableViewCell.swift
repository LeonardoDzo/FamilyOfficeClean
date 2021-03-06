//
//  MessageTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia
import RxCocoa
import RxSwift

class MessageTableViewCell: UITableViewCellX, MessageBindible {
    private let disposeBag = DisposeBag()
    var message: ChatMessage!
    var viewModel: MessageViewModel!
    
    var messageText: UILabelX! = UILabelX()
    var date: UILabelX! = UILabelX()
    var nameSender: UILabelX! = UILabelX()
    var photoMessage: UIImageViewX! = UIImageViewX()
    var bubbleView = UIImageViewX()
    
    //Action
    let btnShare = UIButton()
    
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
           ),
           btnShare
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
        btnShare.setImage(#imageLiteral(resourceName: "icons8-link"), for: .normal)
        btnShare.centerVertically()
        messageText.centerVertically()
        date.bottom(1)
        let view = UIView()
        view.backgroundColor = UIColor.clear
        selectedBackgroundView = view
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
    }
    
    func isFromSender(isMe: Bool) {
        if isMe {
            self.bubbleView.bottom(7.5).top(7.5).right(15).left(>=40)
            btnShare.left(5%)

        }else{
            self.bubbleView.bottom(7.5).top(7.5).left(15).right(>=40)
            btnShare.right(5%)
        }
        
        let image =  isMe ? #imageLiteral(resourceName: "chat_bubble_sent") : #imageLiteral(resourceName: "chat_bubble_received")
        
        if message.attachment == nil && message.data == nil {
            btnShare.isHidden = true
        }
        bubbleView.image = image
            .resizableImage(withCapInsets:
                UIEdgeInsetsMake(17, 21, 17, 21),
                            resizingMode: .stretch)
            .withRenderingMode(.alwaysTemplate)
        
        let color =  isMe ? #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1) : #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        
        
        switch message.status {
            case .Pending:
                bubbleView.tintColor = color.withAlphaComponent(0.5)
                return
            default:
                bubbleView.tintColor = color
                return
        }
        
    
    }
    
    
    func bindToView(chatId: String) -> Void {
        viewModel = MessageViewModel(message: self.message, chatId: chatId)
        let image = BehaviorRelay(value: self.photoMessage.image).asDriver()
        let tap = btnShare.rx.tap.asDriver()
        
        let input = MessageViewModel.Input(tap: Driver.combineLatest(tap, image))
        
        let output = viewModel.transform(input: input)
        
        output.tapped.drive().disposed(by: disposeBag)
    }
    
    
  
    
}

