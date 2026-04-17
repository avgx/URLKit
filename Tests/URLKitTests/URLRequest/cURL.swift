import Foundation
import Testing
@testable import URLKit

@Test func cURL_containsMethodAndURL() {
    var request = URLRequest(url: URL(string: "https://api.example/items")!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let line = request.cURL(pretty: false)
    #expect(line.contains("curl "))
    #expect(line.contains("-X "))
    #expect(line.contains("POST"))
    #expect(line.contains("https://api.example/items"))
}
