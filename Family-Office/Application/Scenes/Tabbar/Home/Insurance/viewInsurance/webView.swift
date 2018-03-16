//
//  insuranceAttachmentView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 06/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
import WebKit

final class webView: UIViewX {
    let webView = WKWebView()
    let loadingView = UIViewX()
    
    convenience init(){
        self.init(frame: .zero)
        render()
    }
    
    func render() -> Void {
        sv(webView, loadingView)
        webView.top(60).left(0).right(0).size(100%)
        webView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        loadingView.top(70).left(0).height(10)
        loadingView.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        loadingView.animation = "squeezeRight"
    }
}
