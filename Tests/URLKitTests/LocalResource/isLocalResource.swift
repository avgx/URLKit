import Foundation
import Testing
@testable import URLKit

@Test func isLocalResource() {
    #expect(URL(string: "file:///tmp/x")!.isLocalResource)
    #expect(URL(string: "data:,hi")!.isLocalResource)
    #expect(!URL(string: "https://a/")!.isLocalResource)
}
