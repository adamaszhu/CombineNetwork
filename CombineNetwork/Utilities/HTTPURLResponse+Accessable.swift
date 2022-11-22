/// Provide access utility for HTTPURLResponse
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public extension HTTPURLResponse {

    /// Get the value of a http header field
    subscript(_ type: HeaderFieldType) -> String? {
        get {
            value(forHTTPHeaderField: type.rawValue)
        }
    }

    /// Get the content type of the response
    var contentType: ContentType? {
        guard let value = self[.contentType] else {
            return nil
        }
        return ContentType.allCases.first { value.contains($0.rawValue) }
    }
}

import Foundation
