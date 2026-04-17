import Foundation

extension URL {
    public var absoluteWithoutQueryString: String {
        guard let query: String = self.query else {
            return self.absoluteString
        }
        return absoluteString.replacingOccurrences(of: "?" + query, with: "")
    }

    public var absoluteWithoutAuthenticationString: String {
        guard var components = URLComponents(string: absoluteString) else {
            return absoluteString
        }
        components.password = nil
        components.user = nil
        return components.url?.absoluteString ?? absoluteString
    }
}
