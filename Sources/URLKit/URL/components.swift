import Foundation

extension URL {
    /// Uses `host` when the receiver already carries a scheme; if `scheme == nil` (e.g. `example.com/path`), parses `https://` + `absoluteString` so a hostname can still be recovered.
    public func host() -> String? {
        if let host = host { return host }
        if scheme == nil, let url = URL(string: "https://" + absoluteString) {
            return url.host ?? ""
        }
        return nil
    }
    
    public func user() -> String? {
        URLComponents(string: absoluteString)?.user
    }
    
    public func password() -> String? {
        URLComponents(string: absoluteString)?.password
    }
    
    public func port() -> Int? {
        URLComponents(string: absoluteString)?.port
    }
    
    public func queryItems() -> [String: String?]? {
        guard let components = URLComponents.init(url: self, resolvingAgainstBaseURL: false),
              let items = components.queryItems
        else { return nil }
        
        return items.reduce(into: [:], { res, next in res[next.name] = next.value })
    }
}
