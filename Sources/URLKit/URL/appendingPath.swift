import Foundation

public extension URL {
    /// Appends a slash-separated relative path (e.g. `"api/v3/ac-backend"`, `"secure/configuration"`).
    ///
    /// Uses `appendingPathComponent` per segment (iOS 15+). Empty segments from leading/trailing `/` are skipped.
    func appendingPath(_ path: String) -> URL {
        let trimmed = path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
        guard !trimmed.isEmpty else { return self }

        return trimmed.split(separator: "/").reduce(into: self) { url, segment in
            url = url.appendingPathComponent(String(segment))
        }
    }
}
