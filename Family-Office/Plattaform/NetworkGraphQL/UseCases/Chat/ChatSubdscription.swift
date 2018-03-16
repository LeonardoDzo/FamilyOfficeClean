//
//  ChatSubdscription.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 13/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

func ChatMessageAdded(id: String) -> [String: Any] {
    if subscriptions.contains(id) {
        return [:]
    }
    subscriptions.append(id)
    return ["variables": ["id": id], "query": "subscription ChatMessageAdded($id: ID!){ chatMessageAdded(chat: $id) { ...ChatMessageDetails, chat {id}}}"
        .appending(ChatMessageDetails.fragmentString)
        .appending(UserDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)]
}
