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
    var text: String
    var sender: Sender
    var sentDate: Date
    var data: MessageData?
    var status: MESSAGESTATUS = .Pending
    
    init(data: Data? = nil, attachment: Attachment? = nil, sender: Sender, messageId: String, date: Date, text: String = "", status: MESSAGESTATUS) {
        if let data = data {
            self.data = MessageData.data(data)
        }else if let attachment = attachment {
            self.data = MessageData.photo(attachment)
        }
        self.sender = sender
        self.messageId = messageId
        self.sentDate = date
        self.status = status
        self.text = text
    }
    
}
