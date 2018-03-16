//
//  SafeboxAttachment+Bindable.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Kingfisher

protocol SafeboxBindable: AnyObject {
    var attachment: SafeboxAttachment! {get set}
    var nameLbl: UILabelX! {get}
    var iconImgView: UIImageViewX! {get}
}

extension SafeboxBindable {
    var nameLbl: UILabelX! {return nil}
    var iconImgView: UIImageViewX! {return nil}
    
    func bind(attachment: SafeboxAttachment) -> Void {
        self.attachment = attachment
        bind()
    }
    func bind() -> Void {
        guard let attachment = attachment else{
            return
        }
        if let view = nameLbl {
            view.text = attachment.name
        }
        
        if let view = iconImgView {
            if attachment.mime.contains("image"){
                
                let url = URL(string: "\(Constants.url.safebox)\(attachment.token!)")
                print("\(Constants.url.safebox)\(attachment.token)")
                view.kf.indicatorType = .activity
                let processor = RoundCornerImageProcessor(cornerRadius: 2)
                view.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "family-default"), options: [.transition(.fade(0.2)), .processor(processor)])
            }else{
                //put generic icon depending on file type
            }
            view.image = #imageLiteral(resourceName: "safeBox") // safebox icon por mientras lmao
        }
    }
}
