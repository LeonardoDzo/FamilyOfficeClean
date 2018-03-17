//
//  Event.swift
//  Family-Office
//
//  Created by Nan Montaño on 14/mar/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

public struct Event: Decodable {
    public var creator: User?
    public var description: String = ""
    public var uid: String = ""
    public var instances = [EventInstance()]
    public var summary: String = ""
    
    enum CodingKeys: String, CodingKey {
        case creator
        case description
        case uid = "id"
        case instances
        case summary
    }

}

public struct EventInstance: Decodable {
    public var parent: Event!
    public var allDay: Bool = false
    public var end: Int = Date().add(hours: 1).toMillis()
    public var location: String = ""
    public var start: Int = Date().toMillis()
    public var status: String = ""
    
    enum CodingKeys: String, CodingKey {
        case allDay = "all_day"
        case end
        case location
        case start
        case status
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        allDay = container.decodeSafely(Bool.self, forKey: .allDay)!
        end = container.decodeSafely(Int.self, forKey: .end)!
        location = container.decodeSafely(String.self, forKey: .location)!
        start = container.decodeSafely(Int.self, forKey: .start)!
        status = container.decodeSafely(String.self, forKey: .status)!
    }
    
    public init() {}
}
