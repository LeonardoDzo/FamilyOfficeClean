//
//  DetailsInsuranceTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa

class DetailsInsuranceTableViewCell: UITableViewCellX, InsuranceBindible {
    private let disposeBag = DisposeBag()
    var insurance: Insurance!
    var nameLbl: UILabelX! = UILabelX()
    var policyLbl: UILabelX! = UILabelX()
    var phoneBtn: UIButtonX! = UIButtonX()
    let bar = UIViewX()
    let imageBtn = UIImageViewX()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            nameLbl,
            policyLbl,
            phoneBtn,
            bar,
            imageBtn
        )
        
        layout(
            7,
            |-nameLbl.height(20)-|,
            5,
            |-policyLbl.height(20)-|,
            5,
            |-phoneBtn.height(20),
            2
        )
        
        imageBtn.image = #imageLiteral(resourceName: "insurances-attachment").maskWithColor(color: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1))
        imageBtn.right(30).size(40).centerVertically()
        phoneBtn.setTitleColor(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1), for: .normal)
        bar.width(3).height(100%)
        bar.backgroundColor = MODULE.INSURANCE.color
        
        bindToView()
    }
    
    func bindToView() -> Void {
        let result = self.phoneBtn.rx.tap.asDriver()
        
        result.drive(onNext: {
            if let url = URL(string: "tel://\(self.insurance.telephone)"), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }).disposed(by: disposeBag)
    }
}
