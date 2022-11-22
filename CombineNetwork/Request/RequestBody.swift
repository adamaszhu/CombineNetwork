/// The body sent along with a HTTP request
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public enum RequestBody {
    
    case dictionary(_ dictionary: [String: Any], bodyType: ContentType)
    case array(_ array: [Any])
    case object(_ object: Encodable)
    case data(_ data: Data)
    
    /// Convert the body to a Data object
    public var data: Data? {
        switch self {
            case .data(let data):
                return data
            case .array(let array):
                return try? JSONSerialization.data(withJSONObject: array, options: .prettyPrinted)
            case .dictionary(let dictionary, .json):
                return try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
            case .dictionary(let dictionary, .form):
                return dictionary.form.data(using: .utf8)
            case .dictionary(_, bodyType: _):
                return nil
            case .object(let object):
                return try? JSONEncoder().encode(object)
        }
    }

    /// The content type of the body
    public var contentType: String? {
        switch self {
            case .data:
                return nil
            case .array, .object:
                return ContentType.json.rawValue
            case .dictionary(_, let bodyType):
                return bodyType.rawValue
        }
    }
}

import Foundation
