//
//  PreHomeNavigator.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import UIKit

protocol PreHomeNavigator {
    func toHome()
    func toMe(user: User)
    func toSignIn()
    func toProfile()
}
class PreHomeNav: PreHomeNavigator {
    
    private let navigationController: UINavigationController
    private let service: RMUserUseCaseProvider
    init(service: RMUserUseCaseProvider, nc: UINavigationController) {
        self.service = service
        self.navigationController = nc
    }
    
    func toMe(user: User) {
    }
    
    func toHome() {
        
    }
    
    func toSignIn() {
        
    }
    
    func toProfile() {
        
    }
}
