//
//  UserNethwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public final class UserNetwork {

    private let network: Network<User>

    init(network: Network<User>) {
        self.network = network
    }

    public func getUsers(phones: [String], rol: Int) -> Observable<[User]> {
       return network.getItems(AllUserQuery(phones: phones, rol: rol))
   }
    public func getAssistants() -> Observable<[User]> {
        return network.getItems_v2(MyAssistantsQuery())
    }
    func getUser(id: String) -> Observable<User> {
        return network.getItem(GetUserQuery(id: id))
    }
}
