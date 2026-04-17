import Foundation

extension URL {
    public func dictionaryFromQuery() -> [String: String] {
        var result: [String: String] = [:]
        guard let query = URLComponents(string: absoluteString)?.queryItems else {
            return result
        }
        for item in query {
            if let value: String = item.value {
                result[item.name] = value
            }
        }
        return result
    }
}
