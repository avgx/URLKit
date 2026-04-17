import Foundation
import Testing
@testable import URLKit

@Test func httpBodyStreamData_readsStream() throws {
    let data = Data("payload".utf8)
    var request = URLRequest(url: URL(string: "https://x/")!)
    request.httpBodyStream = InputStream(data: data)
    let read = try #require(request.httpBodyStreamData())
    #expect(read == data)
}

@Test func httpBodyStreamData_nilWithoutStream() {
    var request = URLRequest(url: URL(string: "https://x/")!)
    request.httpBodyStream = nil
    #expect(request.httpBodyStreamData() == nil)
}
