import Foundation

extension URL {
    /// Build URL for mailto‑link with params
    public static func mailto(
        _ to: String,
        cc: String? = nil,
        bcc: String? = nil,
        subject: String? = nil,
        body: String? = nil
    ) -> URL? {
        var components = URLComponents()
        components.scheme = "mailto"
        components.path = to
        
        var queryItems = [URLQueryItem]()
        
        if let cc = cc {
            queryItems.append(URLQueryItem(name: "cc", value: cc))
        }
        
        if let bcc = bcc {
            queryItems.append(URLQueryItem(name: "bcc", value: bcc))
        }
        
        if let subject = subject {
            queryItems.append(URLQueryItem(name: "subject", value: subject))
        }
        
        if let body = body {
            queryItems.append(URLQueryItem(name: "body", value: body))
        }
        
        if !queryItems.isEmpty {
            components.queryItems = queryItems
        }
        
        return components.url
    }
}

