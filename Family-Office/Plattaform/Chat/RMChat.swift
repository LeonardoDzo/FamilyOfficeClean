//
//  RMChat.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 07/03/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//
import Foundation
import RealmSwift

@objcMembers
final class RMChat: Object {
    
    dynamic var family: RMFamily?
    
    dynamic var name = ""
    
    dynamic var photo: RMAttachment?
    
    dynamic var uid: String = ""
    
    dynamic var lastMessage: RMMessage?
    
    dynamic var members = List<RMChatMembership>()
    
    dynamic var messages = List<RMMessage>()
    
    
    override class func primaryKey() -> String {
        return "uid"
    }
}

extension RMChat: DomainConvertibleType {
    func asDomain() -> Chat {
        let group = name.isEmpty ? nil :ChatGroup(name: name, photo: photo?.asDomain())
        return Chat(family: family?.asDomain(), group: group, uid: uid, lastMessage: lastMessage?.asDomain(), members: Array(members.map({$0.asDomain()})), messages: Array(messages.map({$0.asDomain()})))
    }
}

extension Chat: RealmRepresentable {
    
    typealias RealmType = RMChat
    
    func asRealm() -> RMChat {
        let realm = try! Realm()
        var message = messages
        if let chat =  realm.object(ofType: RMChat.self, forPrimaryKey: uid) {
            let oldmessage = Array(chat.messages.map { $0.asDomain() })
            message = oldmessage
        }
        return RMChat.build({ (obj) in
            obj.family = family?.asRealm()
            obj.uid = uid
            obj.name = group?.name ?? ""
            obj.photo = group?.photo?.asRealm()
            obj.lastMessage = lastMessage?.asRealm()
            obj.messages.append(objectsIn: message.map({$0.asRealm()}))
            obj.members.append(objectsIn: members.map({$0.asRealm()}))
        })
    }
   
}

