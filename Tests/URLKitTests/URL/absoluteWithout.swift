import Foundation
import Testing
@testable import URLKit

@Test func absoluteWithoutQueryString() {
    let url = URL(string: "https://x.test/path?q=1")!
    #expect(!url.absoluteWithoutQueryString.contains("?"))
    #expect(url.absoluteWithoutQueryString.contains("/path"))
}

@Test func absoluteWithoutAuthenticationString() {
    let url = URL(string: "https://u:p@host/path")!
    let s = url.absoluteWithoutAuthenticationString
    #expect(!s.contains("u:"))
    #expect(!s.contains("@"))
}
