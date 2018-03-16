//
//  UserSubscription.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
var subscriptions = [String]()

func UserSubscription(_ user: User) -> [String: Any] {
    if subscriptions.contains(user.uid) {
        return [:]
    }
    subscriptions.append(user.uid)
    return ["variables": ["id": user.uid], "query": "subscription UserChanged($id:ID){userChanged(id:$id) {...UserDetails}}"
        .appending(UserDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)]
}
