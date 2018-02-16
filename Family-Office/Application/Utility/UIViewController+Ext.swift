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
    var backBtn: UIBarButtonItem! {
       return UIBarButtonItem(image: #imageLiteral(resourceName: "back-27x20").maskWithColor(color: #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)), style: .plain, target: self, action: nil)
    }
    
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
    @objc func back() -> Void {
        if (navigationController?.popViewController(animated: true)) != nil {
            
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    open override func reloadInputViews() {
        on("INJECTION_BUNDLE_NOTIFICATION") {
            self.viewDidLoad()
        }
    }
    
    
}
