//
//  FamilyTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class FamilyTableViewCell: UITableViewCell, FamilyBindable {
    
    var family: Family!
    var titleLbl: UILabelX! = UILabelX()
    var photo: UIImageViewX! = UIImageViewX()
    var selectedPhoto: UIImageViewX! = UIImageViewX()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
   
    fileprivate func render() {
        sv(
            titleLbl.style(self.nameStyle),
            photo,
            selectedPhoto
        )
        titleLbl.isUserInteractionEnabled = false
        photo.isUserInteractionEnabled = false
        selectedPhoto.isUserInteractionEnabled = false
        photo.size(50).centerVertically()
        alignHorizontally(|-20-photo-titleLbl.height(20)-selectedPhoto.size(20)-20-|)
        titleLbl.sizeToFit()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        render()
    }
    
    func nameStyle(l:UILabelX) {
        l.font = .systemFont(ofSize: 18)
        l.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
