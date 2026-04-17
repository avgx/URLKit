import Foundation
import Testing
@testable import URLKit

@Test func init_staticString_roundtrip() {
    let url = URL(staticString: "https://static.init.test/")
    #expect(url.host == "static.init.test")
}
