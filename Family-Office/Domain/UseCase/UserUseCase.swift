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
    func getUsers(byFamily: Family) -> Observable<[User]>
    func getUsers(phones: [String], rol: Int) -> Observable<[User]>
    func getAssistants() -> Observable<[User]>
    func edit(user: User, photo: Data?) -> Observable<Void>
    //func allUser(fid: String) -> Void
}
