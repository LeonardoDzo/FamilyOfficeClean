//
//  MainSafeboxView.swift
//  Family-Office
//
//  Created by Jesús Ernesto Jaramillo Salazar on 14/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Stevia

class MainSafebox: UIViewX {
    let tabbar = UITabBar()
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let tableView = UITableView()
    let searchBar = UISearchBar()
    let allBtn = UITabBarItem(title: "Todos", image: #imageLiteral(resourceName: "icons8-plus_2_math"), tag: 0)
    let filesBtn = UITabBarItem(title: "Archivos", image: #imageLiteral(resourceName: "icons8-plus_2_math"), tag: 1)
    let imgBtn = UITabBarItem(title: "Imágenes", image: #imageLiteral(resourceName: "icons8-plus_2_math"), tag: 2)
    let newBtn = UITabBarItem(title: "Nuevo", image:#imageLiteral(resourceName: "icons8-plus_2_math"), tag: 3)
    convenience init(){
        self.init(frame: .zero)
        render()
    }
    
    func render() -> Void {
        self.setupCollection()
        self.setupTable()
        sv(tableView, collectionView, tabbar.style(self.styleTabbar), searchBar)
        
        tabbar.items = [allBtn, filesBtn, imgBtn, newBtn]
        tabbar.bottom(0).left(0).right(0).width(100%).height(45)
        tabbar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        collectionView.isHidden = true
        
        collectionView.bottom(45).top(105).width(100%).left(0).right(0)
        tableView.bottom(45).top(105).width(100%).left(0).right(0)
        tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let label = UILabelX()
        label.text = "No hay archivos"
        label.textAlignment = .center
        
        collectionView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        searchBar.top(65).height(40).width(100%)
        
        backgroundColor = #colorLiteral(red: 0.9792956669, green: 0.9908331388, blue: 1, alpha: 1)
        
    }
    
    private func setupTable(){
        tableView.rowHeight = 50
        tableView.estimatedRowHeight = 50
        tableView.register(SafeboxTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupCollection(){
        let layout = UICollectionViewFlowLayout()
        let bounds = UIScreen.main.bounds
        let width = (bounds.size.width - 50) / 3
        
        layout.minimumLineSpacing = 7
        layout.minimumInteritemSpacing = 7
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: width, height: width)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.allowsSelection = true
        collectionView.register(SafeboxCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
    
    func styleTabbar(_ tabbar: UITabBar) -> Void {
        tabbar.tintColor = MODULE.SAFEBOX.color
    }
}
