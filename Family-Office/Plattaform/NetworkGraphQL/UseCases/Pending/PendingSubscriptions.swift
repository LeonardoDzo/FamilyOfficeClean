//
//  PendingSubscriptions.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

func PendingAddedSubscription() -> [String: Any] {
    return ["query": "subscription PendingAdded{pendingAdded {...PendingDetails}}".appending(PendingDetails.fragmentString)]
}
