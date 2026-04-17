import Foundation
import Testing
@testable import URLKit

@Test func pretty_stripsSchemeAndFragment() {
    let url = URL(string: "https://example.org/v1/session?x=1#section")!
    let p = url.pretty()
    #expect(!p.contains("#"))
    #expect(!p.hasPrefix("http"))
    #expect(!p.contains("https://"))
}

@Test func pretty_nonDirectory_dropsTrailingSlashFromDisplay() {
    let url = URL(string: "https://example.org/v1")!
    let p = url.pretty()
    #expect(p == "example.org/v1")
}
