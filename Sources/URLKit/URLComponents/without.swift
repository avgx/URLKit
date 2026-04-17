import Foundation

extension URLComponents {
    public var urlWithoutFragment: URL? {
        var x = self
        x.fragment = nil
        return x.url
    }
}
