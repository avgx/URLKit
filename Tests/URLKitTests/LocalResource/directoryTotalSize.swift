import Foundation
import Testing
@testable import URLKit

@Test func directoryTotalSize_sumsChildren() throws {
    let dir = FileManager.default.temporaryDirectory.appendingPathComponent("urlkit-dir-\(UUID().uuidString)", isDirectory: true)
    try FileManager.default.createDirectory(at: dir, withIntermediateDirectories: true)
    try Data("ab".utf8).write(to: dir.appendingPathComponent("a.txt"))
    try Data("cd".utf8).write(to: dir.appendingPathComponent("b.txt"))
    defer { try? FileManager.default.removeItem(at: dir) }
    let total = try dir.directoryTotalSize()
    #expect(total == 4)
}
