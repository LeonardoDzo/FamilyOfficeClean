//
//  UserInviteTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 22/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class UserInviteTableViewCell: UITableViewCellX, UserBindable {
    var user: User!
    var nameLbl: UILabelX! = UILabelX()
    var photoProfile: UIImageViewX! = UIImageViewX()
    var btnInvite = UIButtonX()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        
    }
    
    func render() -> Void {
        sv(photoProfile,nameLbl,btnInvite)
        photoProfile.size(50).centerVertically()
        alignHorizontally(|-20-photoProfile-nameLbl.height(20)-btnInvite.width(20%).width(30)-|)
        btnInvite.style { (btn) in
            btn.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
            btn.text("Invitar")
            btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }

}
