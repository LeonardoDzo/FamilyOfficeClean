//
//  PreHomeStevia.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import RxCocoa
import RxSwift

class Prehome: UIViewX, UserBindable {
    var user: User!
    var tableView : UITableView = UITableView()
    var topContent = UIImageViewX()
    var photoProfile: UIImageViewX = UIImageViewX()
    var nameLbl: UILabelX! = UILabelX()
    var emailLbl: UILabelX! = UILabelX()
    var settingBtn = UIButtonX()
    var logoutBtn = UIButtonX()
    var creteFamilybtn = UIButtonX()
    convenience init() {
        self.init(frame:CGRect.zero)
        render()
    }
    
    fileprivate func styleForBtnCreateFamily() -> (UIButtonX) -> Void {
        return { (btn) in
            btn.cornerRadius = 40
            btn.animation = "squeezeUp"
            btn.curve =  "spring"
            btn.delay = 1
            btn.setImage(#imageLiteral(resourceName: "icons8-add").maskWithColor(color: #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)), for: .normal)
            btn.shadowOpacity = 0.3
            btn.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            btn.shadowRadius = 2
        }
    }
    
    fileprivate func styles() {
        photoProfile.setImage(url: URL(string: "https://x1.xingassets.com/assets/frontend_minified/img/users/nobody_m.original.jpg")!, placeholderImage: #imageLiteral(resourceName: "profile_default"))
        settingBtn.style(self.styleBtn).style({ (btn) in
            btn.setImage(#imageLiteral(resourceName: "Setting"), for: .normal)
        })
        logoutBtn.style(self.styleBtn).style { (btn) in
            btn.setImage(#imageLiteral(resourceName: "logout"), for: .normal)
        }
        logoutBtn.style(self.styleBtn)
        photoProfile.centerHorizontally()
        emailLbl.style(self.styleTextField)
        nameLbl.style(self.styleTextField)
        photoProfile.style(self.styleImg)
        creteFamilybtn.style(self.styleForBtnCreateFamily())
    }
    
    func render() {
        sv(
            topContent,
            emailLbl,
            photoProfile,
            nameLbl,
            settingBtn,
            logoutBtn,
            creteFamilybtn,
            tableView
        )
        conftable()
        layout(
            0,
            |topContent.height(300).width(100%)|,
            10,
            |-tableView.width(100%)-|,
            10,
            creteFamilybtn,
            ""
        )
        
        topContent.layout(
            70,
            nameLbl.height(20).width(100%),
            5,
            emailLbl.height(20).width(100%),
            40,
            photoProfile,
            0,
            ""
        )
        creteFamilybtn.height(80).width(80).bottom(5%).centerHorizontally()
        settingBtn.top(240).left(15%)
        logoutBtn.top(240).right(15%)
        topContent.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        topContent.image = #imageLiteral(resourceName: "background_profile")
        topContent.contentMode = .scaleToFill
        photoProfile.width(100).height(100)
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        styles()
        animations()
        
    }
    
    fileprivate func conftable() {
        tableView.refreshControl = UIRefreshControl()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 64
        tableView.register(FamilyTableViewCell.self, forCellReuseIdentifier: FamilyTableViewCell.reuseID)
        
        tableView.tableFooterView = UIView()
    }
    
    func styleImg(_ img: UIImageViewX) -> Void {
        img.clipsToBounds = true
        img.cornerRadius = 50
        img.borderColor = borderColor
        img.borderWidth = 1
        img.animation = "fadeIn"
    }
    
    func styleBtn(_ btn: UIButtonX) -> Void {
        btn.width(40).height(40)
        btn.animation = "pop"
    }

    func styleTextField(_ text: UILabelX) -> Void {
        text.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        text.height(20)
        text.font = UIFont.systemFont(ofSize: 18.0)
        text.adjustsFontSizeToFitWidth = true
        text.centerHorizontally()
        text.textAlignment = .center
    }
}

