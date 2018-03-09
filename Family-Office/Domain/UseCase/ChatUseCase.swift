//
//  ChatUseCase.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 08/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift

public protocol ChatUseCase {
    func get(byGroup: Bool?) -> Observable<[Chat]>
    func save(chatId: String, message: Message) -> Observable<Void>
    func createt(chat: Chat) -> Observable<Chat>
}
