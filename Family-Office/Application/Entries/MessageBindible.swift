//
//  MessageBindible.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import Kingfisher

protocol MessageBindible: AnyObject {
    
    var message: ChatMessage! {get set}
    
    var messageText: UILabelX! {get}
    
    var photoSender: UIImageViewX! {get}
    
    var nameSender: UILabelX! {get}
    
    var date: UILabelX! {get}
    
    var photoMessage: UIImageViewX! {get}
    
}
extension MessageBindible {
    
    var messageText: UILabelX! {return nil}
    
    var photoSender: UIImageViewX! {return nil}
    
    var nameSender: UILabelX! {return nil}
    
    var date: UILabelX! {return nil}
    
    var photoMessage: UIImageViewX! {return nil}
    
    
    func bind(message: ChatMessage) -> Void {
        self.message = message
        self.bind()
    }
    
    func bind() -> Void {
        guard let message = message else { return }
        
        if let view = messageText {
            if !message.text.isEmpty {
                view.isHidden = false
                view.numberOfLines = 0
                view.text = message.text
                view.height(>=14)
                view.textAlignment = .justified
                view.font = UIFont(name: "Thonburi", size: UIFont.systemFontSize)!
            }else{
                view.height(>=14)
                view.isHidden = true
            }
        }

        if let view = photoMessage{
            view.cornerRadius = 8
            view.size(270)
            view.clipsToBounds = true
            if let data = message.attachment {
                view.isHidden = false
                view.contentMode = .scaleAspectFill
                let token = UserDefaults().value(forKey: "token") as? String ?? ""
                let url = URL(string: data.routes[1].appending("?token=\(token)"))
                view.kf.indicatorType = .activity
                view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "icons8-remove_image"))
            }else if let data = message.data {
                let image = UIImage(data: data, scale: 1.0)
                view.image = image
            }else{
                view.size(0)
                view.isHidden = true
            }
        }

        if let view = photoSender {
            view.cornerRadius = view.bounds.size.width / 2
            view.clipsToBounds = true
            view.size(40)
            let url = URL(string: message.sender?.photo?.routes[2] ?? "")
            view.kf.indicatorType = .activity
            view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "profile_default"))
        }
        
        if let view = nameSender {
            view.text = message.sender?.displayName
            view.textAlignment = .left
            view.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 14)!
            view.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        }
        
        if let view = date {
            view.text = Date(message.seenAt)?.string(with: .HHmm) ?? ""
            view.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 11)!
            view.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
        
        

    }
}
