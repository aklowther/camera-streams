//
//  StreamManagerTests.swift
//  Camera StreamsTests
//
//  Created by Adam Lowther on 3/31/18.
//  Copyright © 2018 Lowther. All rights reserved.
//

import Foundation
import XCTest

class StreamManagerTests: XCTest {

    func testNumberOfStreams() {
        let streamtest:StreamManager = StreamManager()
        streamtest.addRTSP(stream: "test")
        XCTAssertTrue(streamtest.savedStreams.count == 1, "saved stream count is wrong")
    }
}
