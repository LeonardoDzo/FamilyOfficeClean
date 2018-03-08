//
//  MessageType.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public protocol MessageType {
    
    /// The sender of the message.
    var sender: Sender { get }
    
    /// The unique identifier for the message.
    ///
    /// NOTE: This value must be unique for all messages as it is
    /// used to cache layout information.
    var messageId: String { get }
    
    /// The date the message was sent.
    var sentDate: Date { get }
    
    /// The kind of message and its underlying data.
    var data: MessageData { get }
    
}
