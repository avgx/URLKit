import Foundation
import Testing
@testable import URLKit

@Test func wsURL_httpToWs() {
    let http = URL(string: "http://example.org/socket")!
    #expect(http.wsURL == URL(string: "ws://example.org/socket")!)
}

@Test func wsURL_httpsToWss() {
    let https = URL(string: "https://example.org/socket")!
    #expect(https.wsURL == URL(string: "wss://example.org/socket")!)
}

@Test func wsURL_preservesPathAndQuery() {
    let https = URL(string: "https://example.org/api/v1?token=abc")!
    #expect(https.wsURL == URL(string: "wss://example.org/api/v1?token=abc")!)
}

@Test func wsURL_otherSchemeUnchanged() {
    let ftp = URL(string: "ftp://example.org/file")!
    #expect(ftp.wsURL == ftp)
}
