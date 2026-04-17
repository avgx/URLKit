import Foundation
import Testing
@testable import URLKit

@Test func invalid_placeholder() {
    #expect(URL.invalid.scheme == "invalid")
}
