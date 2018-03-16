//
//  MockMessage.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

struct MockMessage: MessageType {
    
    var messageId: String
    var sender: Sender
    var sentDate: Date
    var data: MessageData
    var status: MESSAGESTATUS = .Pending
    
    init(data: MessageData, sender: Sender, messageId: String, date: Date, text: String = "", status: MESSAGESTATUS) {
        self.data = data
        self.sender = sender
        self.messageId = messageId
        self.sentDate = date
        self.status = status
    }
    
    init(text: String, sender: Sender, messageId: String, date: Date, status: MESSAGESTATUS) {
        self.init(data: .text(text), sender: sender, messageId: messageId, date: date, status: status)
    }
    
    init(attributedText: NSAttributedString, sender: Sender, messageId: String, date: Date, status: MESSAGESTATUS) {
        self.init(data: .attributedText(attributedText), sender: sender, messageId: messageId, date: date, status: status)
    }
    
    init(image: Attachment, sender: Sender, messageId: String, date: Date, status: MESSAGESTATUS) {
        self.init(data: .photo(image), sender: sender, messageId: messageId, date: date, status: status)
    }
    
    init(thumbnail: UIImage, sender: Sender, messageId: String, date: Date, status: MESSAGESTATUS) {
        let url = URL(fileURLWithPath: "")
        self.init(data: .video(file: url, thumbnail: thumbnail), sender: sender, messageId: messageId, date: date, status: status)
    }
    
    init(location: CLLocation, sender: Sender, messageId: String, date: Date, status: MESSAGESTATUS) {
        self.init(data: .location(location), sender: sender, messageId: messageId, date: date, status: status)
    }
    
    init(emoji: String, sender: Sender, messageId: String, date: Date, status: MESSAGESTATUS) {
        self.init(data: .emoji(emoji), sender: sender, messageId: messageId, date: date, status: status)
    }
    
}
