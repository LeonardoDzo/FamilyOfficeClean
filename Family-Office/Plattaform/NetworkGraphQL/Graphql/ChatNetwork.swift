//
//  ChatNetwork.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

final class ChatNetwork {
    private let network: Network<Chat>
    init(network: Network<Chat>) {
        self.network = network
    }
}
