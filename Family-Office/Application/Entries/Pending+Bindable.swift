//
//  Pending+Bindeble.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

extension PENDING_PRIORITY {
    var color: UIColor! {
        switch self {
        case .Low:
            return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case .Normal:
            return #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        case .High:
            return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

        }
    }
}
protocol PendingBindable: AnyObject {
    var pending: Pending! {get set}
    var titleLbl: UILabelX! {get}
    var createdAtLbl: UILabelX! {get}
    var updatedAtLbl: UILabelX! {get}
    var detailsTxtV: UITextView! {get}
    var priority: UIViewX! {get}
    var doneImg: UIImageViewX! {get}
}
extension PendingBindable {
    var titleLbl: UILabelX! {return nil}
    var detailsTxtV: UITextView! {return nil}
    var priority: UIViewX! {return nil}
    var doneImg: UIImageViewX! {return nil}
    var createdAtLbl: UILabelX! {return nil}
    var updatedAtLbl: UILabelX! {return nil}
    func bind(pending: Pending) {
        self.pending = pending
        bind()
    }
    func bind() {
        guard let pending = self.pending else {return}

        if let titleLbl = titleLbl {
            titleLbl.text = pending.title
            titleLbl.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        }
        if let updatedAtLbl = updatedAtLbl {
            updatedAtLbl.text = pending.updated_at.toDate().string(with: .MMMddHHmm)
        }
        if let createdAtLbl = createdAtLbl {
            createdAtLbl.text = pending.created_at.toDate().string(with: .MMMddHHmm)
        }
        if let detailsTxtV = detailsTxtV {
            detailsTxtV.text = pending.details
            detailsTxtV.isEditable = false
            detailsTxtV.isUserInteractionEnabled = false
        }
        if let priority = priority {
            priority.backgroundColor = self.pending.priority.color
        }
        if let doneImg = doneImg {
            doneImg.image = pending.done ? #imageLiteral(resourceName: "check-1").maskWithColor(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))! : #imageLiteral(resourceName: "icons8-clock").maskWithColor(color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))!
        }
        if let doneImg = doneImg {
            doneImg.image = pending.done ? #imageLiteral(resourceName: "check-1").maskWithColor(color: #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1))! : #imageLiteral(resourceName: "icons8-clock").maskWithColor(color: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))!
        }

    }

}
