import Foundation
import Testing
@testable import URLKit

@Test func components_userPasswordPort() {
    let url = URL(string: "https://alice:secret@example.org:8443/path")!
    #expect(url.user() == "alice")
    #expect(url.password() == "secret")
    #expect(url.port() == 8443)
}

@Test func host_resolvesWhenSchemePresent() {
    let withScheme = URL(string: "https://example.org/")!
    #expect(withScheme.host() == "example.org")
}
