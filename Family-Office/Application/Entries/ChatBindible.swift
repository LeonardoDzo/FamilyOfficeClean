//
//  ChatBindible.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 16/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import Kingfisher

protocol ChatBindible: AnyObject {
    
    var chat: Chat! {get set}
    
    var userLbl: UILabelX! {get}
    
    var dateLbl: UILabelX! {get}
    
    var badgeCount: UILabelX! {get}
    
    var lastMessage: UILabelX! {get}
    
    var title: UILabelX! {get}
    
    var photo: UIImageViewX! {get}
    
}
extension ChatBindible {
    
    var userLbl: UILabelX! {return nil}
    
    var title: UILabelX! {return nil}
    
    var badgeCount: UILabelX! {return nil}
    
    var dateLbl: UILabelX! {return nil}
    
    var lastMessage: UILabelX! {return nil}
    
    var photo: UIImageViewX! {return nil}
    
    
    func bind(chat: Chat) -> Void {
        self.chat = chat
        self.bind()
    }
    
    func bind() -> Void {
        
        guard let chat = self.chat else {return}
        
        let message = chat.messages.last
        
        if let view = title {
            view.font = UIFont(name: "Thonburi-Bold", size: UIFont.systemFontSize)!
            var name: String? = ""
            switch chat.getType() {
                case .Family:
                    name = chat.family?.name
                    break
                case .Group:
                    name = chat.group?.name
                    break
                default:
                    let user = chat.members.first(where: {$0.user?.uid != me})?.user
                    name = user?.displayName
                    break
            }
            view.text = name
        }
        
        if let view = userLbl {
            if chat.getType() == .OneToOne {
                view.numberOfLines = 2
                view.height(<=40)
                let text = message?.attachment != nil ? "📷" : ""
                view.text =  text + (message?.text)!
                view.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                view.sizeToFit()
            }else{
                view.text = message?.sender?.uid == me ? "Tú: " : message?.sender?.displayName
                view.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
        
        if let view = dateLbl, let badge = badgeCount {
            badge.cornerRadius = 10
            badge.clipsToBounds = true
            if let dateInt = message?.seenAt {
                let date = Date(dateInt)
                view.text = (date?.isToday())! ? date?.string(with: .HHmm) : date?.string(with: .MMddyyyy)
                if let user = chat.members.first(where: {$0.user?.uid == me}) {
                    if message?.sender?.uid != me && user.seenAt  < dateInt {
                        let count = chat.messages.filter({$0.seenAt > user.seenAt}).count
                        badge.text = "\(count)"
                        view.textColor = #colorLiteral(red: 0.2151380236, green: 0.4630439142, blue: 0.8590748961, alpha: 1)
                        badge.backgroundColor = #colorLiteral(red: 0.2151380236, green: 0.4630439142, blue: 0.8590748961, alpha: 1)
                        badge.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                        badge.textAlignment = .center
                        badgeCount.isHidden = false
                    }else{
                        badgeCount.isHidden = true
                        view.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
                    }
                }
            }

        }
        
        if let view = photo {
            view.cornerRadius = 8
            view.clipsToBounds = true
            view.image = #imageLiteral(resourceName: "family-default")
            switch chat.getType() {
                case .Family:
                    if let att = chat.family?.photo {
                        view.kf.setImage(with: URL(string: att.routes[1]))
                    }
                    break
                case .Group:
                    if let att = chat.group?.photo {
                        view.kf.setImage(with: URL(string: att.routes[1]))
                    }
                    break
                default:
                    let user = chat.members.first(where: {$0.user?.uid != me})?.user
                    if let att = user?.photo {
                        view.kf.setImage(with: URL(string: att.routes[1]))
                    }
                    break
            }
        }
        
        if let view = lastMessage {
            if chat.getType() != .OneToOne {
                view.text = message?.text
                view.isHidden = false
            }else{
                view.isHidden = true
            }
        }
        
        
    }

}
