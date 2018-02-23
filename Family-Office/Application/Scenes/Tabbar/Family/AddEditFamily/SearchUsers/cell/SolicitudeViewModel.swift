//
//  SolicitudeViewModel.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 23/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

struct SolicitudeFamilyViewModel {
    var user : User!
    var isInvited: Bool!
    init(user: User, isInvited: Bool = false) {
        self.user = user
        self.isInvited = isInvited
    }
}
