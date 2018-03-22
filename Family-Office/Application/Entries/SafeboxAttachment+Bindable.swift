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
    
    func bind(attachment: SafeboxAttachment, history: [String]) -> Void {
        let dumbArr = attachment.name.split(separator: "/")
        self.attachment = attachment
        self.attachment.name = String(describing: dumbArr[history.count - 1])
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
            view.image = nil
            switch NSString(string: attachment.name).pathExtension{
            case "":
                view.image = #imageLiteral(resourceName: "safebox_folder")
                break
            case "jpg", "jpeg", "png":
                let url = URL(string: "\(Constants.url.safebox)\(attachment.token!)")
                let resource = ImageResource(downloadURL: url!, cacheKey: attachment.name)
                view.kf.indicatorType = .activity
                let processor = RoundCornerImageProcessor(cornerRadius: 2)
                view.kf.setImage(with: resource, placeholder: #imageLiteral(resourceName: "safebox_file"), options: [.transition(.fade(0.2)), .processor(processor)], progressBlock: nil, completionHandler: nil)
                break
            case "docx", "txt":
                view.image = #imageLiteral(resourceName: "docx_file")
                break
            case "xls", "xlsx", "csv":
                view.image = #imageLiteral(resourceName: "xls_file")
                break
            default: break
            }
            
        }
    }
}
