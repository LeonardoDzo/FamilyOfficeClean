//
//  AuthUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol AuthUseCase {
    func signIn(email: String, password: String) -> Observable<User>
//    func signUp(user: User) -> Observable<User>
//    func logOut() -> Observable<Void>
}
