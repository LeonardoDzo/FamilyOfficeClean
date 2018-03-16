//
//  SafeboxAttachment+Bindable.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
//import KingerFisher

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
                //get thumbnail of attachment
            }else{
                //put generic icon depending on file type
            }
            view.image = #imageLiteral(resourceName: "safeBox") // safebox icon por mientras lmao
        }
    }
}
