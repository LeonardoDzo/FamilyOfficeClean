//
//  MenuMainStevia.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class MenuMainAss: UIViewX {
    var btns = [UIButtonX]()
    let allBtn = UIButtonX()
    let line = UIViewX()
    var views = [UIView]()
    let doneBtn = UIButtonX()
    let pendingBtn = UIButtonX()
    var colorPrimary: UIColor!
    var selected = 0
    convenience init() {
        self.init(frame:.zero)
        // This is only needed for live reload as injectionForXcode
        // doesn't swizzle init methods.
        // Get injectionForXcode here : http://johnholdsworth.com/injection.html
        render()
    }
    convenience init(total: [String], colorPrimary: UIColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)) {
        self.init(frame:.zero)
        self.colorPrimary = colorPrimary
        total.enumerated().forEach { (i,text) in
            let btn = UIButtonX()
            btn.text(text)
            btn.tag = i
            btn.style(commonFieldStyle)
            btns.append(btn)
        }
        views = btns
        views.append(line)
        renderv2()
    }
    func renderv2() -> Void {

        sv(
            views
        )
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let count = (width/CGFloat(btns.count))
        
        var ci = 0
        btns.enumerated().forEach( { (arg) in
            let (i, btn) = arg
            btn.left(CGFloat(ci)+8).width(count).height(60).top(0)
            ci = Int(count) * (i+1)
        })
    
        line.left(8).width(count).height(5).top(46)
        line.backgroundColor = colorPrimary
        line.cornerRadius = 2

    }
    
    
    func styleMenu(handler: @escaping ((MenuMainAss)->Void)) {
        handler(self)
    }
    
    fileprivate func setStyleBtns() {
        btns.forEach({self.commonFieldStyle($0)})
        allBtn.style(commonFieldStyle)
        pendingBtn.style(commonFieldStyle)
        doneBtn.style(commonFieldStyle)
    }
    
    func render() {
        // View Hierarchy
        // This essentially does `translatesAutoresizingMaskIntoConstraints = false`
        // and `addSubsview()`. The neat benefit is that
        // (`sv` calls can be nested which will visually show hierarchy ! )
 
        layout(
            4,
            |-allBtn.width(33%)-doneBtn.width(33%)-pendingBtn.width(33%)-| ~ 60,
            2,
            |-line-| ~ 5,
            2
        )
        alignHorizontally(allBtn,doneBtn,pendingBtn)
        line.width(120)
        line.backgroundColor = colorPrimary
        line.cornerRadius = 2
        allBtn.tag = 0
        doneBtn.tag = 1
        doneBtn.centerHorizontally()
        pendingBtn.tag = 2
        // Content 🖋
        allBtn.text("Todas")
        doneBtn.text("Terminadas")
        pendingBtn.text("Pendientes")
        
        setStyleBtns()
    }
    
    func indexLine(from: Int, to: Int) -> Void {
        selected = to
        self.line.animation = to >= from ? "slideRight" : "slideLeft"
        let x = self.bounds.size.width/3 * CGFloat(to) + 8
        line.frame.origin.x = x
       
        setStyleBtns()
        line.animate()
    }
    
    // Style can be extracted and applied kind of like css \o/
    // but in pure Swift though!
    func commonFieldStyle(_ f:UIButtonX) {
        f.cornerRadius = 6
        
        f.clipsToBounds = true
        
        f.setTitleColor(f.tag == selected ? colorPrimary : #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1), for: .normal)
        f.contentHorizontalAlignment = .center
        f.contentVerticalAlignment = .fill
        f.isEnabled = true
    }
    
}

