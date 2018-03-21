//
//  FamilySubscription.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

func FamilySubscription(_ family: Family) -> [String: Any] {
    if subscriptions.contains("FamilyChanged\(family.uid)") {
        return [:]
    }
    subscriptions.append("FamilyChanged\(family.uid)")
    return ["variables": ["id": family.uid], "query": "subscription FamilyChanged($id:ID){familyChanged(id:$id) {...FamilyDetails }}"
        .appending(FamilyDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)]
}

func FamilyMembershipAddedSubscription() -> [String: Any] {
    return ["query": "subscription FamilyMembershipAdded{ familyMembershipAdded{...FamilyMembershipDetails}"
        .appending(FamilyMembershipDetails.fragmentString)
        .appending(AttachmentDetails.fragmentString)
        .appending(FamilyDetails.fragmentString)
        .appending(UserDetails.fragmentString)]
}
