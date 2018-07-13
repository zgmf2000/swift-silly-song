//
//  Silly_SongTests.swift
//  Silly SongTests
//
//  Created by Bintoro Adi Guna on 7/11/18.
//  Copyright © 2018 Vector Industries. All rights reserved.
//

import XCTest
@testable import Silly_Song

class Silly_SongTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRemoveConsonantBeforeFirstVowel() {
        let name = "Nate";
        let expectedProcessedName = "ate";
        let actualProcessedName = shortNameFromName(name: name);
        XCTAssertEqual(actualProcessedName, expectedProcessedName, "Should be ate because the first vowel is a, and the consonant before it is 'N'.");
    }
    
    func testRemoveNothingIfFirstCharacterIsAVowel() {
        let name = "Aaron";
        let expectedProcessedName = "aaron";
        let actualProcessedName = shortNameFromName(name: name);
        XCTAssertEqual(actualProcessedName, expectedProcessedName, "Should be aaron because the first vowel is also the first character in the string.");
    }
    
    func testRemoveNothingIfNoVowelInName() {
        let name = "Gwn";
        let expectedProcessedName = "gwn";
        let actualProcessedName = shortNameFromName(name: name);
        XCTAssertEqual(actualProcessedName, expectedProcessedName, "Should be gwn because because no vowel is found in the string.");
    }
    
}
