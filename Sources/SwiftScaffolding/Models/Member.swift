//
//  Member.swift
//  SwiftScaffolding
//
//  Copyright (c) 2025-2026 CylorineStudio. All rights reserved.
//
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file.
//

import Foundation

public struct Member: Codable, Hashable, Equatable {
    /// 玩家名。
    public let name: String
    /// 玩家的 `machine_id`。
    public let machineId: String
    /// 玩家的联机客户端信息。
    public let vendor: String
    /// 玩家类型。
    public let kind: Kind
    
    public enum Kind: String, Codable {
        case host = "HOST"
        case guest = "GUEST"
    }
    
    public enum CodingKeys: String, CodingKey {
        case name
        case machineId = "machine_id"
        case vendor
        case kind
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.machineId = try container.decode(String.self, forKey: .machineId)
        self.vendor = try container.decode(String.self, forKey: .vendor)
        self.kind = try container.decodeIfPresent(Member.Kind.self, forKey: .kind) ?? .guest
    }
    
    public init(name: String, machineID: String, vendor: String, kind: Kind) {
        self.name = name
        self.machineId = machineID
        self.vendor = vendor
        self.kind = kind
    }
}
