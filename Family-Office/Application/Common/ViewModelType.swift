//
//  ViewModelType.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
