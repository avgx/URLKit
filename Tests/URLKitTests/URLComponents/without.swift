import Foundation
import Testing
@testable import URLKit

@Test func urlComponents_urlWithoutFragment() {
    let c = URLComponents(string: "https://h/p#f")!
    #expect(c.urlWithoutFragment?.fragment == nil)
    #expect(c.urlWithoutFragment?.absoluteString.contains("#") == false)
}
