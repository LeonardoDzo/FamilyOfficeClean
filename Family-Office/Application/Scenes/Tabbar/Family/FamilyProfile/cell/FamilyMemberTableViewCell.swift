//
//  FamilyMemberTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 20/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class FamilyMemberTableViewCell: UITableViewCellX, UserBindable {
    var user: User!
    var nameLbl: UILabelX! = UILabelX()
    var photoProfile: UIImageViewX! = UIImageViewX()
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
            photoProfile
        )
        photoProfile.size(50).centerVertically()
        alignHorizontally(|-20-photoProfile-nameLbl.height(20)-20-|)

    }
    func nameStyle(l: UILabelX) {
        l.font = .systemFont(ofSize: 18)
        l.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }

}
