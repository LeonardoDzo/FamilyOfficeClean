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
    func get(id: String) -> Observable<Chat>
    func get(uid: String) -> Observable<Chat>
    func save(chatId: String, message: ChatMessage) -> Observable<Void>
    func create(chat: Chat, data: Data?) -> Observable<Chat>
    func create(userId: String) -> Observable<Chat>
    func seenToChat(id: String) -> Observable<Void>
}
