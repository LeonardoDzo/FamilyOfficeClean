//
//  MessageData.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit
import class CoreLocation.CLLocation

/// An enum representing the kind of message and its underlying data.
public enum MessageData {
    
    case text(String)
    
    /// A message with attributed text.
    case attributedText(NSAttributedString)
    
    /// A photo message.
    case photo(Attachment)
    
    /// A photo message.
    case data(Data)
    
    /// A video message.
    case video(file: URL, thumbnail: UIImage)
    
    /// A location message.
    case location(CLLocation)
    
    /// An emoji message.
    case emoji(String)
    
    // MARK: - Not supported yet
    
    //    case audio(Data)
    //
    //    case system(String)
    //
    //    case custom(Any)
    //
    //    case placeholder
    
}
