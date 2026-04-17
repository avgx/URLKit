import Foundation

extension URL {
    /// Total size in bytes of all files under this directory URL (non-recursive enumeration of errors yields 0 for that entry).
    public func directoryTotalSize(fileManager: FileManager = .default) throws -> Int64 {
        guard let urls = fileManager.enumerator(at: self, includingPropertiesForKeys: nil)?.allObjects as? [URL] else {
            return 0
        }
        return try urls.lazy.reduce(Int64(0)) {
            let size = try $1.resourceValues(forKeys: [.fileSizeKey]).fileSize
            return Int64(size ?? 0) + $0
        }
    }
}
