import Foundation
import Testing
@testable import URLKit

@Test func appendingPath_singleSegment() {
    let base = URL(string: "https://example.org/")!
    #expect(base.appendingPath("api") == URL(string: "https://example.org/api")!)
}

@Test func appendingPath_multipleSegments() {
    let base = URL(string: "https://example.org/")!
    #expect(
        base.appendingPath("api/v3/ac-backend")
            == URL(string: "https://example.org/api/v3/ac-backend")!
    )
}

@Test func appendingPath_trimsSlashes() {
    let base = URL(string: "https://example.org/")!
    #expect(
        base.appendingPath("/secure/configuration/")
            == URL(string: "https://example.org/secure/configuration")!
    )
}

@Test func appendingPath_emptyPath_returnsSelf() {
    let base = URL(string: "https://example.org/v1/")!
    #expect(base.appendingPath("") == base)
    #expect(base.appendingPath("///") == base)
}

@Test func appendingPath_baseWithoutTrailingSlash() {
    let base = URL(string: "https://example.org")!
    #expect(
        base.appendingPath("api/v3")
            == URL(string: "https://example.org/api/v3")!
    )
}

@Test func appendingPath_withExistingPath() {
    let base = URL(string: "https://example.org/foo/")!
    #expect(
        base.appendingPath("api/v3")
            == URL(string: "https://example.org/foo/api/v3")!
    )
}
