//
//  MainAssistantView.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia
class MainAssistantViewStevia: UIViewX {
    let menu = MenuMainAss(total: ["Todos","Pendientes", "Terminadas"], colorPrimary: #colorLiteral(red: 0.9518877864, green: 0.5812291503, blue: 0.4435725808, alpha: 1))
    let table = TaskTableview()
    convenience init() {
        self.init(frame: CGRect.zero)
        // This is only needed for live reload as injectionForXcode
        // doesn't swizzle init methods.
        // Get injectionForXcode here : http://johnholdsworth.com/injection.html
        render()
    }

    func render() {

        // View Hierarchy
        // This essentially does `translatesAutoresizingMaskIntoConstraints = false`
        // and `addSubsview()`. The neat benefit is that
        // (`sv` calls can be nested which will visually show hierarchy ! )
        sv(
            menu,
            table
        )

        // Vertical + Horizontal Layout in one pass
        // With type-safe visual format
        layout(
            60,
            |menu.height(60)|,
            2,
            |table.height(100%)|,
            >=40
        )
        // Styling 🎨
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
    }

    @objc
    func changeType(_ n: Int) {
        menu.indexLine(from: table.type, to: n)
        table.type = n
    }

    // Style can be extracted and applied kind of like css \o/
    // but in pure Swift though!
    func commonFieldStyle(_ f: UITextField) {
        f.borderStyle = .roundedRect
        f.font = UIFont(name: "HelveticaNeue-Light", size: 26)
        f.returnKeyType = .next
    }
}
