import Foundation

extension URL {
    public var isLocalResource: Bool {
        scheme == "file" || scheme == "data"
    }
}
