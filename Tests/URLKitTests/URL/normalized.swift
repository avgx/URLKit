import Foundation
import Testing
@testable import URLKit

@Test func normalizedDirectoryBase_addsSlashWhenNoQueryOrFragment() {
    let u = URL(string: "https://example.org/v1")!
    #expect(u.normalizedDirectoryBase().absoluteString.hasSuffix("/"))
}

@Test func normalizedDirectoryBase_preservesQueryAndFragment() {
    let withQuery = URL(string: "https://example.org/v1?a=1")!
    let withFragment = URL(string: "https://example.org/v1#part")!
    #expect(withQuery.normalizedDirectoryBase() == withQuery)
    #expect(withFragment.normalizedDirectoryBase() == withFragment)
}
