//
//  PreferenceStoreTests.swift
//  ExamplesTests
//
//  Created by Patricia Fulk on 4/5/23.
//
import XCTest
@testable import Examples

class PreferenceStoreTests: XCTestCase {
    var sut: PreferenceStore!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        try super.setUpWithError()
        sut = PreferenceStore()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testHeaderPreferenceTrue() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.headerPreference = true
        XCTAssertTrue(sut.headerPreference)
    }

    func testHeaderPreferenceFalse() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.headerPreference = false
        XCTAssertFalse(sut.headerPreference)
    }

    func testSummaryPreferenceTrue() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.summaryPreference = true
        XCTAssertTrue(sut.summaryPreference)
    }

    func testSummaryPreferenceFalse() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.summaryPreference = false
        XCTAssertFalse(sut.summaryPreference)
    }
    
    func testFooterPreferenceTrue() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.footerPreference = true
        XCTAssertTrue(sut.footerPreference)
    }

    func testFooterPreferenceFalse() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.footerPreference = false
        XCTAssertFalse(sut.footerPreference)
    }

    func testSummaryBackgroundColorPreferenceBlue() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.summaryBackgroundColorPreference = .blue
        XCTAssertTrue(sut.summaryBackgroundColorPreference.title == "Blue")
        XCTAssertTrue(sut.summaryBackgroundColorPreference.color == .blue)
        XCTAssertTrue(ColorSelection.from(string: sut.summaryBackgroundColorPreference.title) == .blue)
    }

    func testSummaryBackgroundColorPreferenceRed() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.summaryBackgroundColorPreference = .red
        XCTAssertTrue(sut.summaryBackgroundColorPreference.title == "Red")
        XCTAssertTrue(sut.summaryBackgroundColorPreference.color == .red)
        XCTAssertTrue(ColorSelection.from(string: sut.summaryBackgroundColorPreference.title) == .red)
    }

    func testSummaryBackgroundColorPreferenceGreen() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.summaryBackgroundColorPreference = .green
        XCTAssertTrue(sut.summaryBackgroundColorPreference.title == "Green")
        XCTAssertTrue(sut.summaryBackgroundColorPreference.color == .green)
        XCTAssertTrue(ColorSelection.from(string: sut.summaryBackgroundColorPreference.title) == .green)
    }

    func testSummaryBackgroundColorPreferenceYellow() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        sut.summaryBackgroundColorPreference = .yellow
        XCTAssertTrue(sut.summaryBackgroundColorPreference.title == "Yellow")
        XCTAssertTrue(sut.summaryBackgroundColorPreference.color == .yellow)
        XCTAssertTrue(ColorSelection.from(string: sut.summaryBackgroundColorPreference.title) == .yellow)
    }
    
    func testColorSelectionInvalid() throws {
        XCTAssertNil(ColorSelection.from(string: "non-color"))
    }
    
    func testResetPreferences() throws {
        // todo
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
