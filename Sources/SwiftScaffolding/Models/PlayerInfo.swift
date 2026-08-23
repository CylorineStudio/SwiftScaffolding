//
//  PlayerInfo.swift
//  SwiftScaffolding
//
//  Copyright (c) 2025-2026 CylorineStudio. All rights reserved.
//
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file.
//

import Foundation

public struct PlayerInfo {
    public let name: String
    public let vendor: String
    
    public init(name: String, vendor: String) {
        self.name = name
        self.vendor = vendor
    }
}
