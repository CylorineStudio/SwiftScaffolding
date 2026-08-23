//
//  Room.swift
//  SwiftScaffolding
//
//  Copyright (c) 2025-2026 CylorineStudio. All rights reserved.
//
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file.
//

import Foundation
import Network

public final class Room: ObservableObject {
    /// 房客列表。
    @Published public internal(set) var members: [Member] = []
    
    /// Minecraft 服务器端口。
    public internal(set) var serverPort: UInt16
    
    internal init(members: [Member], serverPort: UInt16) {
        self.members = members
        self.serverPort = serverPort
    }
}
