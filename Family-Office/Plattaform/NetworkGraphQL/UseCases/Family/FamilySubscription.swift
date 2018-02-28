//
//  FamilySubscription.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 19/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

func FamilySubscription(_ family: Family) -> [String: Any] {
    return ["variables": ["id": family.uid], "query": "subscription FamilyChanged($id:ID){familyChanged(id:$id) {...FamilyDetails, members{ user{ ...UserDetails, families { family{ ...FamilyDetails }}}}}}".appending(FamilyDetails.fragmentString).appending(PhotoDetails.fragmentString).appending(UserDetails.fragmentString)]
}

func FamilyMembershipAddedSubscription() -> [String: Any] {
    return ["query": "subscription FamilyMembershipAdded{ familyMembershipAdded{ family{ ...FamilyDetails}, user{...UserDetails}}}"
        .appending(FamilyDetails.fragmentString)
        .appending(PhotoDetails.fragmentString)
        .appending(UserDetails.fragmentString)]
}
