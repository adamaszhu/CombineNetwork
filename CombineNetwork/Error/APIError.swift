/// Any error throwned by a APIClient
///
/// - version: 1.0.0
/// - date: 19/11/22
/// - author: Adamas
public enum APIError: Error {
    case decoding(detail: String)
    case encoding
    case url
    case network(_ error: NetworkError)
    case http(_ error: HTTPError)
    case business(_ error: BusinessError)
    case other
}

extension APIError: Equatable {

    public static func == (lhs: APIError, rhs: APIError) -> Bool {
        switch (lhs, rhs) {
            case (.other, .other),
                (.decoding, .decoding),
                (.encoding, .encoding),
                (.url, .url):
                return true
            case (.network(let lhsNetworkError), .network(let rhsNetworkError)):
                return lhsNetworkError == rhsNetworkError
            case (.http(let lhsHTTPError), .http(let rhsHTTPError)):
                return lhsHTTPError == rhsHTTPError
            case (.business(let lhsBusinessError), .business(let rhsBusinessError)):
                return lhsBusinessError.localizedDescription == rhsBusinessError.localizedDescription
            default:
                return false
        }
    }
}

extension APIError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
            case .decoding(let detail):
                return detail
            case .encoding, .url, .other:
                return String(describing: self)
            case .network(let networkError):
                return String(describing: networkError)
            case .http(let httpError):
                return String(describing: httpError)
            case .business(let businessError):
                return businessError.localizedDescription
        }
    }
}

import Foundation
