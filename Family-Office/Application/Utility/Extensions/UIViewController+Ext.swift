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
import ALCameraViewController
import Lightbox

extension UIViewController {
    var backBtn: UIBarButtonItem! {
        return UIBarButtonItem(image: #imageLiteral(resourceName: "back-27x20").maskWithColor(color: #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)), style: .plain, target: self, action: #selector(self.back))
    }

    var errorBinding: Binder<Error> {
        return Binder(self, binding: { (vc, error) in
            var text = "Error!!"

            if let e = error as? RxApolloError, case RxApolloError.graphQLErrors(let errors) = e {
                text = errors.first?.localizedDescription ?? "Something wrong!!"
            } else {
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
    @objc func back() {
        if (navigationController?.popViewController(animated: true)) != nil {

        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

    @objc func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =     UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
     @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func selectImage( completion: @escaping (UIImage?) -> Void) {
        let croppingEnabled = true
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camara", style: .default, handler: { (action: UIAlertAction) in
            let croppingEnabled = true
            let cameraViewController = CameraViewController(croppingParameters: CroppingParameters(isEnabled: croppingEnabled, allowResizing: true, allowMoving: true)) { [weak self] image, asset in
                
                guard image != nil else {
                    self?.dismiss(animated: true, completion: nil)
                    completion(nil)
                    return
                }
                completion(image)
                self?.dismiss(animated: true, completion: nil)
            }
            
            self.present(cameraViewController, animated: true, completion: nil)
            
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Galería", style: .default, handler: { (action: UIAlertAction) in
            
            /// Provides an image picker wrapped inside a UINavigationController instance
            let imagePickerViewController = CameraViewController.imagePickerViewController(croppingParameters: CroppingParameters(isEnabled: croppingEnabled, allowResizing: true, allowMoving: true)) { [weak self] image, asset in
                guard image != nil else {
                    completion(nil)
                    self?.dismiss(animated: true, completion: nil)
                    return
                }
                completion(image)
                self?.dismiss(animated: true, completion: nil)
            }
            
            self.present(imagePickerViewController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }

}
