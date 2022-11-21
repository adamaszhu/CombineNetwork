/// Defines what an API is
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public protocol API {
    var path: String { get }
    var method: RequestMethod { get }
    var body: RequestBody? { get }
    var parameters: URLParameters? { get }
    var headers: RequestHeaders? { get }
}

public extension API {

    var body: RequestBody? { nil }

    var parameters: URLParameters? { nil }

    var headers: RequestHeaders? { nil }
}
