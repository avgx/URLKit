import Foundation

public extension URL {
    /// Returns a URL normalized as a directory base with a trailing `/`.
    ///
    /// URLs with query or fragment are returned unchanged.
    func normalizedDirectoryBase() -> URL {
        let value = absoluteString
        guard !value.hasSuffix("/") else { return self }
        if value.contains("?") || value.contains("#") {
            return self
        }
        return URL(string: value + "/") ?? self
    }
}
