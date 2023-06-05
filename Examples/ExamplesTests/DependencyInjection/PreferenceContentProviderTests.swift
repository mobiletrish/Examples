import XCTest
@testable import Examples

class PreferenceContentProviderTests: XCTestCase {
    var provider: PreferenceContentProvider<MockPreferenceStore>!
    
    override func setUp() {
        super.setUp()
        provider = PreferenceContentProvider(store: MockPreferenceStore())
    }
    
    override func tearDown() {
        provider = nil
        super.tearDown()
    }
    
    func testDisplayHeader() {
        // Given
        let expectedValue = true
        
        // When
        let actualValue = provider.displayHeader
        
        // Then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func testDisplaySummary() {
        // Given
        let expectedValue = false
        
        // When
        let actualValue = provider.displaySummary
        
        // Then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func testDisplayFooter() {
        // Given
        let expectedValue = true
        
        // When
        let actualValue = provider.displayFooter
        
        // Then
        XCTAssertEqual(actualValue, expectedValue)
    }
    
    func testSummaryBackgroundColor() {
        // Given
        let expectedValue = ColorSelection.red
        
        // When
        let actualValue = provider.summaryBackgroundColor
        
        // Then
        XCTAssertEqual(actualValue, expectedValue)
    }
}

// Mock PreferenceStore for testing
class MockPreferenceStore: PreferenceStoreProtocol {
    func resetPreferences() {
        
    }
    
    var headerPreference: Bool = true
    var summaryPreference: Bool = false
    var footerPreference: Bool = true
    var summaryBackgroundColorPreference: ColorSelection = .red
}
