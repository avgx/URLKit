import Foundation
import Testing
@testable import URLKit

@Test func identifiable_id_matchesAbsoluteString() {
    let url = URL(string: "https://a/b?c=1")!
    #expect(url.id == url.absoluteString)
}
