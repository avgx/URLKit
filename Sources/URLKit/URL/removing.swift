import Foundation

extension URL {
    public func removingCredentials() -> URL {
        var components = URLComponents(string: absoluteString)!
        components.user = nil
        components.password = nil
        return components.url!
    }
    
    public func removingCredentialsAndPort() -> URL {
        var components = URLComponents(string: absoluteString)!
        components.user = nil
        components.password = nil
        components.port = nil
        return components.url!
    }
}
