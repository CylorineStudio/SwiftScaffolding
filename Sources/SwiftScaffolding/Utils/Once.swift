//
//  Once.swift
//  SwiftScaffolding
//
//  Copyright (c) 2025-2026 CylorineStudio. All rights reserved.
//
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file.
//

actor Once {
    private var done: Bool = false
    func run(_ body: () -> Void) {
        guard !done else { return }
        done = true
        body()
    }
}
