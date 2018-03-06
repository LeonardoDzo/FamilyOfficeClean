//
//  MainIllnessVieww.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class MainIllness: UIViewX {
    let tabbar = UITabBar()
    let tableView = UITableView()
    let searchBar = UISearchBar()
    let allBtn = UITabBarItem(title: "Todos", image: #imageLiteral(resourceName: "salud-grey"), tag: 0)
    let painBtn = UITabBarItem(title: "Dolores", image: #imageLiteral(resourceName: "pain-icon"), tag: 1)
    let sicknessBtn = UITabBarItem(title: "Enfermedades", image: #imageLiteral(resourceName: "sickness-icon"), tag: 2)
    let newBtn = UITabBarItem(title: "Nuevo", image: #imageLiteral(resourceName: "icons8-plus_2_math"), tag: 3)
    convenience init() {
        self.init(frame: .zero)
        render()
    }
    
    func render() -> Void {
        
        sv(tableView,tabbar.style(self.styleTabbar), searchBar)
        
        tabbar.items = [allBtn,painBtn,sicknessBtn,newBtn]
        tabbar.bottom(0).left(0).right(0).width(100%).height(45)
        
        searchBar.top(65).height(40).width(100%)
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        tabbar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        tableView.bottom(45).top(105).width(100%).left(0).right(0)
        
        conftable()
        let label = UILabelX()
        label.text = "No se encontro nada :("
        label.textAlignment = .center
        let button = UIButtonX()
        button.text("Try again!")
        let view = UIView()
        view.sv(label, button)
        label.centerInContainer()
        button.bottom(40%).width(100)
        button.cornerRadius = 8
        button.centerHorizontally().backgroundColor = #colorLiteral(red: 0.1788346171, green: 0.3957612514, blue: 0.5594384074, alpha: 1)
        tableView.backgroundView = view
    }
    
    fileprivate func conftable() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = 80
        tableView.register(IllnessTableViewCell.self, forCellReuseIdentifier: IllnessTableViewCell.reuseID)
        tableView.tableFooterView = UIView()
    }

    func styleTabbar(_ tabbar: UITabBar) -> Void {
        tabbar.tintColor = MODULE.FIRSTKIT.color
    }
}
