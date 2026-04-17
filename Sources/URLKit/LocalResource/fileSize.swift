import Foundation

extension URL {
    public var attributes: [FileAttributeKey: Any]? {
        return try? FileManager.default.attributesOfItem(atPath: path)
    }

    public var fileSize: UInt64? {
        return attributes?[.size] as? UInt64
    }

    public func removeFile() {
        try? FileManager.default.removeItem(at: self)
    }
}
