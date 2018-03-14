//
//  HomeBtn+UIBtn.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

enum MODULE {
    case CALENDAR,
        CHAT,
        SAFEBOX,
        INSURANCE,
        FIRSTKIT,
        ASSISTANT
    
    var color: UIColor {
        switch self {
        case .CALENDAR:
            return #colorLiteral(red: 1, green: 0.2901960784, blue: 0.3529411765, alpha: 1)
        case .CHAT:
            return #colorLiteral(red: 0.01568627451, green: 0.7019607843, blue: 0.9960784314, alpha: 1)
        case .SAFEBOX:
            return #colorLiteral(red: 0.9607843137, green: 0.7215686275, blue: 0.1176470588, alpha: 1)
        case .INSURANCE:
            return #colorLiteral(red: 0.1137254902, green: 0.7176470588, blue: 0.4352941176, alpha: 1)
        case .FIRSTKIT:
            return #colorLiteral(red: 0.5490196078, green: 0.5294117647, blue: 0.7843137255, alpha: 1)
        case .ASSISTANT:
            return #colorLiteral(red: 0.9529411765, green: 0.5137254902, blue: 0.3529411765, alpha: 1)
        }
    }
   
}
extension MODULE {
    
    public func iconBtn() -> UIImage {
        switch self {
        case .CALENDAR:
            return #imageLiteral(resourceName: "Calendar")
        case .CHAT:
            return #imageLiteral(resourceName: "chat")
        case .SAFEBOX:
            return #imageLiteral(resourceName: "safeBox")
        case .INSURANCE:
            return #imageLiteral(resourceName: "insurance")
        case .FIRSTKIT:
            return #imageLiteral(resourceName: "FirstKit")
        case .ASSISTANT:
            return #imageLiteral(resourceName: "asistance")

        }
    }

}

struct HomeBtn {
    var photo: UIImage!
    var color: UIColor!
    var module: MODULE
    init(_ module: MODULE) {
        self.photo = module.iconBtn()
        self.color = module.color
        self.module = module
    }
    static let btns: [HomeBtn] = {
        let calendar = HomeBtn(.CALENDAR)
        let chat = HomeBtn(.CHAT)
        let safeBox = HomeBtn(.SAFEBOX)
        let insurance = HomeBtn(.INSURANCE)
        let firstAidkit = HomeBtn(.FIRSTKIT)
        let assitant = HomeBtn(.ASSISTANT)

        return [calendar, chat, safeBox, insurance, firstAidkit, assitant]

    }()

}
