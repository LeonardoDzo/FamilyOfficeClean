//
//  SolicitudeTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa

class SolicitudeTableViewCell: UITableViewCell {
    private let disposeBag = DisposeBag()
    
    var details = UILabelX()
    var confirmBtn = UIButtonX()
    var deleteBtn = UIButtonX()
    
    private let viewModel = ApplicationFamilyViewwModel(useCase: NetUseCaseProvider().makeApplicationUseCase())
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {

        super.init(style: style, reuseIdentifier: reuseIdentifier)

        sv(
            details,
            confirmBtn,
            deleteBtn
        )
        layout(
        2,
        |-details.width(100%)| ~ 80,
        2,
        |-confirmBtn.width(100).height(30)-deleteBtn.width(100).height(30)|,
        2)
        details.numberOfLines = 2
        details.top(2).width(100%).height(30).centerVertically()
        
        confirmBtn.text("Confirmar")
        confirmBtn.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        confirmBtn.cornerRadius = 6
        deleteBtn.text("Cancelar")
        deleteBtn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        deleteBtn.cornerRadius = 6
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 0.1096317488)
    }
    
    func bind(app: ApplicationFamily) -> Void {
      
        if  case .Pending? = app.status  {
            self.details.text = "Aceptar la familia: \(app.family.name)"
            confirmBtn.isHidden = false
            deleteBtn.isHidden = false
            bindToViewModel(app: app)
        }else{
              self.details.text = "Ya eres miembro de la Familia \(app.family.name)"
             confirmBtn.isHidden = true
              deleteBtn.isHidden = true
        }
        details.sizeToFit()
    }
    
    func bindToViewModel(app: ApplicationFamily) -> Void {
        let btnrx = self.confirmBtn.rx.tap.asDriver()
        let combine = Driver.combineLatest(btnrx, BehaviorRelay(value: app).asDriver()).asDriver()
        let input = ApplicationFamilyViewwModel.Input(accept: combine)
        let output = self.viewModel.transform(input: input)
        
        output.accepted.drive().disposed(by: disposeBag)
    }
    

}
