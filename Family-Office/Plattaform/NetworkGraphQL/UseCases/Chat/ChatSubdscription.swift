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
func chatMembershipChanged(chat: String) -> [String: Any] {
    return ["variables": ["id": chat], "query": "subscription ChatMembershipChanged($id: ID!) { chatMembershipChanged(chat: $id) {...ChatMembershipDetails} }"
        .appending(ChatMembershipDetails.fragmentString)
        .appending(UserDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)]
}

func chatMembershipAdded(chat: String) -> [String: Any] {
    return ["variables": ["id": chat], "query": "subscription ChatMembershipAdded($id: ID!) { chatMembershipAdded(chat: $id) {...ChatMembershipDetails} }"
        .appending(ChatMembershipDetails.fragmentString)
        .appending(UserDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)]
}

func chatMembershipRemoved(chat: String) -> [String: Any] {
    return ["variables": ["id": chat], "query": "subscription ChatMembershipRemoved($id: ID!) { chatMembershipRemoved(chat: $id) {...ChatMembershipDetails} }"
        .appending(ChatMembershipDetails.fragmentString)
        .appending(UserDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)]
}
