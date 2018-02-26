//
//  Pending.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 12/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation

 public enum PENDING_PRIORITY: String, CustomStringConvertible {
    case Low
    case Normal
    case High

    public var description: String {
        switch self {
        case .High:
            return "Alta"
        case .Normal:
            return "Normal"
        case .Low:
            return "Baja"
        }
    }

}
extension PENDING_PRIORITY: Codable {
    enum CodingKeys: String, CodingKey {
        case Low, Normal, High
    }
}

public struct Pending: Codable {
    public var uid: String = ""
    public var details: String = ""
    public var title: String = ""
    public var priority: PENDING_PRIORITY = .Normal
    public var done: Bool = false
    public var type: Int = 0
    public var seen: Bool = false
    public var boss: String = ""
    public var assistantId: String = ""
    public var created_at: Int = 0
    public var updated_at: Int = 0

    init() {
    }
    public init(from decoder: Decoder) throws {

        if  let values = try? decoder.container(keyedBy: CodingKeys.self) {
            title = try values.decode(String.self, forKey: .title)
            details = try values.decodeIfPresent(String.self, forKey: .details) ?? ""
            uid = try values.decode(String.self, forKey: .uid)
            priority = try values.decode(PENDING_PRIORITY.self, forKey: .priority)
            created_at = try values.decodeIfPresent(Int.self, forKey: .created_at) ?? 0
            updated_at = try values.decodeIfPresent(Int.self, forKey: .updated_at) ?? 0
        }

    }
}
