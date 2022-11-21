/// Standard HTTP status code error thrown by the server
/// https://en.wikipedia.org/wiki/List_of_HTTP_status_codes
///
/// - version: 1.0.0
/// - date: 19/11/22
/// - author: Adamas
public enum HTTPError: Int, Error {

    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case unprocessableEntity = 422
    case internalServer = 500
    case badGateway = 502
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case other = 0

    /// Convert a http status code into a HTTPError.
    ///
    /// - Parameter statusCode: The http status code.
    public init?(statusCode: Int) {
        if let error = HTTPError(rawValue: statusCode) {
            self = error
            return
        }
        if 200..<400 ~= statusCode {
            return nil
        } else {
            self = .other
        }
    }
}
