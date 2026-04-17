import Foundation

/// Resolves a discovery root string (often protocol-relative, e.g. `//host:443/tpan1/.../webclient/`)
/// into an absolute URL suitable as a `RequestBuilder.baseURL`.
public extension URL {
    /// Resolves `root` into an absolute URL using the receiver as a reference.
    ///
    /// - **Protocol-relative** (`//host:port/path/`): prepends `self.scheme` (defaulting to `https`) plus `":"`.
    /// - **Absolute** (`http(s)://...`): parsed as-is.
    /// - **Path-only** (`/tpan1/...`): resolved relative to `self` via `URL(string:relativeTo:)`.
    ///
    /// The result is normalized as a directory base (trailing `/`) so it concatenates cleanly with `RequestBuilder` URL rules.
    func resolvingRoot(_ root: String) throws -> URL {
        let trimmed = root.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            throw URLError(.badURL)
        }

        let resolved: URL
        if trimmed.hasPrefix("//") {
            let scheme = (self.scheme ?? "https") + ":"
            guard let url = URL(string: scheme + trimmed) else {
                throw URLError(.badURL)
            }
            resolved = url
        } else if trimmed.hasPrefix("/") {
            guard let url = URL(string: trimmed, relativeTo: self)?.absoluteURL else {
                throw URLError(.badURL)
            }
            resolved = url
        } else if let url = URL(string: trimmed), url.scheme != nil {
            resolved = url
        } else {
            throw URLError(.badURL)
        }

        return resolved.normalizedDirectoryBase()
    }

    /// Same as `resolvingRoot(_:)` but returns `nil` instead of throwing.
    func resolvingRootIfPresent(_ root: String?) -> URL? {
        guard let root else { return nil }
        let trimmed = root.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return nil }
        return try? resolvingRoot(trimmed)
    }
}

extension URL {
    public static func from2SlashString(scheme: String?, s: String?) -> URL? {
        guard let raw = s?.trimmingCharacters(in: .whitespacesAndNewlines),
              !raw.isEmpty,
              raw != "//"
        else { return nil }

        // Already full URL → return as is
        if raw.contains("://"), let url = URL(string: raw) {
            return url
        }

        let scheme = scheme ?? "https"

        let full: String

        if raw.hasPrefix("//") {
            // Case: //host/path → "https://host/path"
            full = "\(scheme):\(raw)"
        } else {
            // Case: host/path → "https://host/path"
            full = "\(scheme)://\(raw)"
        }

        return URL(string: full)
    }
}
