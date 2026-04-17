import Foundation
import Testing
@testable import URLKit

@Test func fileSize_readsTempFile() throws {
    let dir = FileManager.default.temporaryDirectory
    let file = dir.appendingPathComponent("urlkit-filesize-\(UUID().uuidString).txt")
    let bytes = Data("12345".utf8)
    try bytes.write(to: file)
    defer { try? FileManager.default.removeItem(at: file) }
    #expect(file.fileSize == 5)
}

@Test func removeFile_deletesFile() throws {
    let dir = FileManager.default.temporaryDirectory
    let file = dir.appendingPathComponent("urlkit-remove-\(UUID().uuidString).txt")
    try Data("x".utf8).write(to: file)
    file.removeFile()
    #expect(!FileManager.default.fileExists(atPath: file.path))
}
