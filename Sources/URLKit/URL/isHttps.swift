import Foundation

extension URL {
    
    public var isHttps: Bool {
        return self.absoluteString.starts(with: "https://")
    }
}
