/// URL utilities.
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
internal extension URL {

    /// Attaching url parameters to an URL.
    /// - Parameter parameters: URL parameters
    /// - Returns: The new URL
    func attaching(_ parameters: URLParameters) -> URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.port = port
        components.path = path
        components.queryItems = parameters.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        // URLComponents will not encode the '+' into "%2B" in the query string
        components.percentEncodedQuery = components.percentEncodedQuery?
            .replacingOccurrences(of: String.plus, with: String.encodedPlus)
        
        return components.url
    }
}

import Foundation
