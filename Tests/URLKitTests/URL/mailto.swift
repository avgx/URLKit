import Foundation
import Testing
@testable import URLKit

@Test func mailto_simple() throws {
    let url = URL.mailto("example@example.com")

    #expect(url == URL(string: "mailto:example@example.com")!)
}

@Test func mailto_with_subject_and_body() throws {
    let url = URL.mailto(
        "user@example.com",
        subject: "Meeting",
        body: "Hello!\nMeating in 15:00."
    )

    #expect(url == URL(string: "mailto:user@example.com?subject=Meeting&body=Hello!%0AMeating%20in%2015:00.")!)
}
