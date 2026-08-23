//
//  RoomCodeTests.swift
//  SwiftScaffolding
//
//  Copyright (c) 2025-2026 CylorineStudio. All rights reserved.
//
//  Use of this source code is governed by an MIT-style
//  license that can be found in the LICENSE file.
//

import XCTest
@testable import SwiftScaffolding

class RoomCodeTests: XCTestCase {
    func testGenerate() {
        print(RoomCode.generate())
    }
    
    func testVerify() {
        XCTAssert(RoomCode.isValid(code: "U/ZZZZ-ZZZZ-ZZZZ-ZZZZ"))
        XCTAssert(RoomCode.isValid(code: "U/UTVM-MNFM-KVLW-FVWS"))
        XCTAssertFalse(RoomCode.isValid(code: "U/ZZZZ-ZZZZ-ZZZZ-ZZZY"))
        XCTAssertFalse(RoomCode.isValid(code: "hdaiwjdoiwajdisjao"))
        XCTAssertFalse(RoomCode.isValid(code: "U/0123-4567-89AB-CDEF"))
    }
}
