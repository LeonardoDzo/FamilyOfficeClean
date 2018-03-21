//
//  UserNethwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 05/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Apollo

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
    func editUser(user: User, photo: Data?) -> Observable<User> {
        let birth: Int? = user.birth > 0 ? user.birth : nil
        let mutation = EditUserMutation(birthday: birth, bloodtype: user.bloodyType, name: user.name, nss: user.nss, phone: user.phone, rfc: user.rfc, file: nil)
        if let data = photo {
            let id = UUID().uuidString
            let file = GraphQLFile(fieldName: "file", originalName: "\(id).jpeg", mimeType: "image/jpeg", data: data)
            return network.postItem(mutation, files: [file])
        }else{
            return network.postItem(mutation)
        }
       
    }
}
