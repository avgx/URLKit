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
    
    public var fileName: String {
        let urlValues = try? resourceValues(forKeys: [.nameKey])
        return urlValues?.name ?? ""
    }
    
    public var isDirectory: Bool {
        let urlValues = try? resourceValues(forKeys: [.isDirectoryKey])
        return urlValues?.isDirectory ?? false
    }
}
