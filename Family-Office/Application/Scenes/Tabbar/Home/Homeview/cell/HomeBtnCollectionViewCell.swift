//
//  HomeBtnCollectionViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa

class HomeBtnCollectionViewCell: UICollectionViewX {
    var btn: UIButtonX! = UIButtonX()
    var model: HomeBtn!
    var viewModel: HomeCellViewmodel!
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
        btn.isUserInteractionEnabled = false
    }
    func bind(_ homeBtn: HomeBtn) -> Void {
        btn.setImage(homeBtn.photo, for: .normal)
        btn.backgroundColor = homeBtn.color
        self.model = homeBtn
//        let combineSelect = Driver.combineLatest(Variable(homeBtn).asDriver(), btn.rx.tap.asDriver())
//        let input = HomeCellViewmodel.Input(selectTrigger: combineSelect)
//        let output = viewModel.transform(input: input)
//        output.selected.drive().dispose()
        self.contentView.animations()
        
    }
    
    func styleBtn(_ btx: UIButtonX) -> Void {
        btn.contentMode = .center
        btn.cornerRadius = 8
        btn.animation = "zoomIn"
    }
    
}
