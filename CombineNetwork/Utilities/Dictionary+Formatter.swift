/// Internal conversion from a dictionary into a web form string.
///
/// - version: 1.0.10
/// - date: 24/11/23
/// - author: Adamas
internal extension Dictionary {
    
    /// Convert the dictionary into a form.
    var form: String {
        map { key, value in
            let key = String(describing: key)
                .addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? .empty
            let value = String(describing: value)
                .addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? .empty
            return key + .equal + value
        }
        .joined(separator: .and)
    }
}

import Foundation
