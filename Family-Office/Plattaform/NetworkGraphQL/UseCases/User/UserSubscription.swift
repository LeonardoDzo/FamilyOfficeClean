//
//  UserSubscription.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation


func UserSubscription(_ user: User) -> [String : Any] {
    return ["variables": ["id": user.uid], "query": "subscription UserChanged($id:ID){userChanged(id:$id) {...UserDetails}}".appending(UserDetails.fragmentString)]
}
