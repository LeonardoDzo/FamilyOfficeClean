//
//  ProfileAssistantView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 09/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import RealmSwift

class ProfileAssistantStevia: UIViewX {
    var topview = TopViewProfileAssistant()
    var notificationToken: NotificationToken? = nil
    convenience init() {
        self.init(frame:CGRect.zero)
        // This is only needed for live reload as injectionForXcode
        // doesn't swizzle init methods.
        // Get injectionForXcode here : http://johnholdsworth.com/injection.html
        render()
        
    }
    
    func render() {
        sv(
            topview
        )
        layout(
            0,
            |topview.width(100%).height(45%)|,
            8,
            ""
        )

        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
    }
}
