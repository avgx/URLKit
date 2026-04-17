import Foundation
import Testing
@testable import URLKit

@Test func dictionaryFromQuery_parsesPairs() {
    let url = URL(string: "https://x.test/?a=1&b=two&empty=")!
    let d = url.dictionaryFromQuery()
    #expect(d["a"] == "1")
    #expect(d["b"] == "two")
}
