//
//  HomeBtnCollectionViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia

class HomeBtnCollectionViewCell: UICollectionViewX {
    var btn: UIButtonX! = UIButtonX()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        render()
        
    }
    func render() -> Void {
        sv(btn.style(self.styleBtn))
        btn.width(100%).height(100%)
    }
    func bind(_ homeBtn: HomeBtn) -> Void {
        btn.setImage(homeBtn.photo, for: .normal)
        btn.backgroundColor = homeBtn.color
        self.contentView.animations()
    }
    
    func styleBtn(_ btx: UIButtonX) -> Void {
        btn.contentMode = .center
        btn.cornerRadius = 8
        btn.animation = "zoomIn"
    }
    
}
