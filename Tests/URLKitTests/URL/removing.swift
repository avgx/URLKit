import Foundation
import Testing
@testable import URLKit

@Test func removingCredentialsAndPort() {
    let url = URL(string: "https://u:p@host:444/p")!
    let stripped = url.removingCredentialsAndPort()
    #expect(stripped.user == nil)
    #expect(stripped.password == nil)
    #expect(stripped.port == nil)
    #expect(stripped.host == "host")
}
