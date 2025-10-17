import XCTest
import SwiftUI
@testable import RSUIButtonKit

final class RSUIButtonKitTests: XCTestCase {
    @MainActor func testButtonInit() {
        let button = RSUButton("Tap") { }
        XCTAssertNotNil(button)
    }

    @MainActor func testStyleDefaults() {
        let style = RSUButtonStyle()
        // Not much to assert visually, but we can ensure it constructs.
        _ = style
        XCTAssertTrue(true)
    }
}
