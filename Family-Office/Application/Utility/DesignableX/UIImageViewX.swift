//
//  UIImageViewX.swift
//  003 - Onboarding Page
//
//  Created by Mark Moeykens on 1/5/17.
//  Copyright © 2017 Mark Moeykens. All rights reserved.
//

import UIKit
import Gzip
let imageCache = NSCache<AnyObject, AnyObject>()

@IBDesignable
class UIImageViewX: SpringImageView {
    var urlString: String?
    private var activityIndicator: UIActivityIndicatorView!
    // MARK: - Properties

    @IBInspectable public var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var filter: UIColor = UIColor.clear {
        didSet {
            let view = UIView(frame: bounds)
            view.backgroundColor = filter
            addSubview(view)
        }
    }

    @IBInspectable var pulseDelay: Double = 0.0

    @IBInspectable var popIn: Bool = false
    @IBInspectable var popInDelay: Double = 0.4

    // MARK: - Shadow

    @IBInspectable public var shadowOpacity: CGFloat = 0 {
        didSet {
            //layer.shadowOpacity = Float(shadowOpacity)
        }
    }

    @IBInspectable public var shadowColor: UIColor = UIColor.clear {
        didSet {
            //layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable public var shadowRadius: CGFloat = 0 {
        didSet {
            //layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable public var shadowOffsetY: CGFloat = 0 {
        didSet {
            //layer.shadowOffset.height = shadowOffsetY
        }
    }

    // MARK: - FUNCTIONS
    override func layoutSubviews() {
//        super.layoutSubviews()
//        layer.shadowColor = shadowColor.cgColor
//        layer.shadowOpacity = Float(shadowOpacity)
//        layer.shadowRadius = shadowRadius
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
    }

    override func draw(_ rect: CGRect) {
        if clipsToBounds && shadowOpacity > 0 {
            layer.masksToBounds = true
            layer.cornerRadius = cornerRadius

            // Outer UIView to hold the Shadow
            let shadow = UIView(frame: rect)
            shadow.layer.cornerRadius = cornerRadius
            shadow.layer.masksToBounds = false
            shadow.layer.shadowOpacity = Float(shadowOpacity)
            shadow.layer.shadowColor = shadowColor.cgColor
            shadow.layer.shadowRadius = shadowRadius
            shadow.layer.shadowOffset.height = shadowOffsetY
            shadow.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath

            shadow.addSubview(self)
        }
    }

    override func awakeFromNib() {
        if pulseDelay > 0 {
            UIView.animate(withDuration: 1, delay: pulseDelay, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: [], animations: {
                self.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }

        if popIn {
            transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
            UIView.animate(withDuration: 0.8, delay: popInDelay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
                self.transform = CGAffineTransform.identity
            }, completion: nil)
        }
    }

   func loadImage(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        showActivityIndicator()

        self.image = nil
        self.urlString = urlString
        //check if image exist in cache
        if let cacheImage = imageCache.object(forKey: urlString as AnyObject) {
            self.image = cacheImage as? UIImage
            hideActivityIndicator()
            return
        }

        //        if let img = rManager.realm.object(ofType: ImageEntity.self, forPrimaryKey: url.absoluteString) {
        //            let decompressedData: Data
        //            if (img.data.isGzipped) {
        //                decompressedData = try! img.data.gunzipped()
        //            } else {
        //                decompressedData = img.data
        //            }
        //            if let downloadImage = UIImage.init(data: decompressedData) {
        //                imageCache.setObject(downloadImage, forKey: urlString as AnyObject)
        //                self.image = nil
        //                self.image = downloadImage
        //                self.hideActivityIndicator()
        //                return
        //            }
        //        }

        URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            if error != nil {
                print(error?.localizedDescription as Any)
                return
            }
            DispatchQueue.main.async {
                let decompressedData: Data
                if (data?.isGzipped)! {
                    decompressedData = try! data?.gunzipped() ?? Data()
                } else {
                    decompressedData = data!
                }
                if let downloadImage = UIImage.init(data: decompressedData) {
                    imageCache.setObject(downloadImage, forKey: urlString as AnyObject)
                    if urlString == self.urlString {
                        self.image = downloadImage
                        self.hideActivityIndicator()
                    }

                }
            }
        }).resume()

    }

    func showActivityIndicator() {

        if (activityIndicator == nil) {
            activityIndicator = createActivityIndicator()
        }

        showSpinning()
    }

    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
    }

    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = UIColor.lightGray
        return activityIndicator
    }

    func showSpinning() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        centerActivityIndicatorInButton()
        activityIndicator.startAnimating()
    }

    private func centerActivityIndicatorInButton() {
        let xCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: activityIndicator, attribute: .centerX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)

        let yCenterConstraint = NSLayoutConstraint(item: self, attribute: .centerY, relatedBy: .equal, toItem: activityIndicator, attribute: .centerY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }
}
