import Foundation
import Testing
@testable import URLKit

@Test func isHttps() {
    #expect(URL(string: "https://a/")!.isHttps)
    #expect(!URL(string: "http://a/")!.isHttps)
}
