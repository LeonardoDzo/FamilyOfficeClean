//
//  HomeBtn+UIBtn.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

struct HomeBtn {
    var photo: UIImage!
    var color: UIColor!
    
    static let btns: [HomeBtn] = {
        let calendar = HomeBtn(photo: #imageLiteral(resourceName: "Calendar"), color: #colorLiteral(red: 1, green: 0.2901960784, blue: 0.3529411765, alpha: 1))
        let chat = HomeBtn(photo: #imageLiteral(resourceName: "chat"), color: #colorLiteral(red: 0.01568627451, green: 0.7019607843, blue: 0.9960784314, alpha: 1))
        let safeBox = HomeBtn(photo: #imageLiteral(resourceName: "safeBox"), color: #colorLiteral(red: 0.9607843137, green: 0.7215686275, blue: 0.1176470588, alpha: 1))
        let insurance = HomeBtn(photo: #imageLiteral(resourceName: "insurance"), color: #colorLiteral(red: 0.1137254902, green: 0.7176470588, blue: 0.4352941176, alpha: 1))
        let firstAidkit = HomeBtn(photo: #imageLiteral(resourceName: "FirstKit"), color: #colorLiteral(red: 0.5490196078, green: 0.5294117647, blue: 0.7843137255, alpha: 1))
        let assitant = HomeBtn(photo: #imageLiteral(resourceName: "asistance"), color: #colorLiteral(red: 0.9529411765, green: 0.5137254902, blue: 0.3529411765, alpha: 1))
        
        return [calendar,chat,safeBox,insurance,firstAidkit,assitant]
        
    }()
    
}
