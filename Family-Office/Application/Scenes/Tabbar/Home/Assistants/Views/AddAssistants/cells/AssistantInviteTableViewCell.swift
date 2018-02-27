//
//  AssistantInviteTableViewCell.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 26/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import UIKit
import Stevia
import RxSwift
import RxCocoa
class AssistantInviteTableViewCell: UITableViewCellX, UserBindable {
    private let disposeBag = DisposeBag()
    
    var user: User!
    var nameLbl: UILabelX! = UILabelX()
    var photoProfile: UIImageViewX! = UIImageViewX()
    var btnInvite = UIButtonX()
    var viewModel = AssistantInviteCellViewModel(solicitudeUseCase: NetUseCaseProvider().makeApplicationAssistantUseCase())
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String? = "cell") {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        
    }
    
    func render() {
        sv(photoProfile, nameLbl, btnInvite)
        photoProfile.size(50).centerVertically()
        alignHorizontally(|-20-photoProfile-nameLbl.height(20)-btnInvite.width(20%).width(30)-|)
        
        btnInvite.style { (btn) in
            btn.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            btn.cornerRadius = 8
        }
        photoProfile.image = #imageLiteral(resourceName: "Blog_Admin_Assistant")
        photoProfile.contentMode = .center
        
    }
    
    func bindViewToModel() {
        let user = BehaviorRelay(value: self.user).asDriver()
        let btn = self.btnInvite.rx.tap.asDriver()
        let merge = Driver.combineLatest(btn, user)
        
        let input = AssistantInviteCellViewModel.Input(inviteTrigger: merge)
        let output = viewModel.transform(input: input)
        output.invited.drive(onNext: { _ in
            self.btnInvite.text("Invitado")
            self.btnInvite.isEnabled = false
        }).disposed(by: disposeBag)
    }
    func bindInviteBtn(isInvited: Bool) {
        btnInvite.text(isInvited ? "Invitado" : "Invitar")
        btnInvite.isEnabled = !isInvited
        self.bindViewToModel()
    }

}
