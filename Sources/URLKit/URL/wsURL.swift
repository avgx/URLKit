import Foundation

public extension URL {
    /// Same resource with WebSocket scheme: `http`→`ws`, `https`→`wss`; other schemes unchanged.
    var wsURL: URL {
        guard var components = URLComponents(url: self, resolvingAgainstBaseURL: false) else {
            return self
        }
        switch components.scheme?.lowercased() {
        case "http":
            components.scheme = "ws"
        case "https":
            components.scheme = "wss"
        default:
            break
        }
        return components.url ?? self
    }
}
