//
//  MemberChatTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class MemberChatTableViewCell: UITableViewCellX, UserBindable {
    var user: User!
    var photoProfile: UIImageViewX! = UIImageViewX()
    var nameLbl: UILabelX! = UILabelX()
    var phoneLbl: UILabelX! = UILabelX()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            nameLbl.style(self.nameStyle),
            photoProfile,
            phoneLbl
        )
        photoProfile.size(50).centerVertically()
        
        phoneLbl.height(20)
        alignHorizontally(|-20-photoProfile-nameLbl.height(20)-20-|)
        alignVertically(nameLbl, phoneLbl.bottom(10))
        alignLefts(nameLbl, phoneLbl)
        
    }
    func nameStyle(l: UILabelX) {
        l.font = .systemFont(ofSize: 18)
        l.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }

    

}
