//
//  UIViewController+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 31/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxCocoa
import UIKit
extension UIViewController {
    var errorBinding: Binder<Error> {
        return Binder(self, binding: { (vc, error) in
            var text = "Error!!"
            
            if let e = error as? RxApolloError, case RxApolloError.graphQLErrors(let errors) = e {
                text = errors.first?.localizedDescription ?? "Something wrong!!"
            }else{
                text = error.localizedDescription
            }
            
            let alert = UIAlertController(title: "Ups!!",
                                          message: text,
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Dismiss",
                                       style: UIAlertActionStyle.cancel,
                                       handler: nil)
            alert.addAction(action)
            vc.present(alert, animated: true, completion: nil)
        })
    }
}
