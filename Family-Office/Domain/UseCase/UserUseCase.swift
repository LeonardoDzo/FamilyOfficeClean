//
//  UserUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol UserUseCase {
    func save(user: User) -> Observable<Void>
    //func delete(user: User) -> Observable<Void>
    func getUser(by id: String) -> Observable<User>
    //func allUser(fid: String) -> Void
    
}
