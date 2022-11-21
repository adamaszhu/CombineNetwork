/// Define an APIClient
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public protocol APIClientType {

    /// Request an object
    ///
    /// - Parameters:
    ///   - request: The URL request
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: An object publisher
    func requestObject<Object: Decodable>(
        using request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type]) -> AnyPublisher<Object?, APIError>

    /// Request a list of objects
    ///
    /// - Parameters:
    ///   - request: The URL request
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: An object list publisher
    func requestObjects<Object: Decodable>(
        using request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type]) -> AnyPublisher<[Object]?, APIError>

    /// Request a data block
    ///
    /// - Parameters:
    ///   - request: The URL request
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: A data publisher
    func requestData(
        using request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type]) -> AnyPublisher<Data?, APIError>
}

public extension APIClientType {

    /// Request an object
    ///
    /// - Parameters:
    ///   - url: The URL
    ///   - method: The HTTP method
    ///   - header: The HTTP header
    ///   - parameters: The URL parameters
    ///   - body: The request body
    ///   - bodyType: The type of the request body
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: An object publisher
    func requestObject<Object: Decodable>(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders? = nil,
        and parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Object?, APIError> {
            requestPublisher(from: url,
                             using: method,
                             attaching: header,
                             and: parameters,
                             with: body)
            .flatMap { self.requestObject(using: $0, promoting: businessErrorTypes) }
            .eraseToAnyPublisher()
        }

    ///// Request a list of objects
    /////
    ///// - Parameters:
    /////   - url: The URL
    /////   - method: The HTTP method
    /////   - header: The HTTP header
    /////   - parameters: The URL parameters
    /////   - body: The request body
    /////   - bodyType: The type of the request body
    /////   - businessErrorTypes: All types of BusinessError that should be detected
    ///// - Returns: An object list publisher
    func requestObjects<Object: Decodable>(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders? = nil,
        and parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<[Object]?, APIError> {
            requestPublisher(from: url,
                             using: method,
                             attaching: header,
                             and: parameters,
                             with: body)
            .flatMap { self.requestObjects(using: $0, promoting: businessErrorTypes) }
            .eraseToAnyPublisher()
        }

    ///// Request a data block
    /////
    ///// - Parameters:
    /////   - url: The URL
    /////   - method: The HTTP method
    /////   - header: The HTTP header
    /////   - parameters: The URL parameters
    /////   - body: The request body
    /////   - bodyType: The type of the request body
    /////   - businessErrorTypes: All types of BusinessError that should be detected
    ///// - Returns: A data publisher
    func requestData(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders? = nil,
        and parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Data?, APIError> {
            requestPublisher(from: url,
                             using: method,
                             attaching: header,
                             and: parameters,
                             with: body)
            .flatMap { self.requestData(using: $0, promoting: businessErrorTypes) }
            .eraseToAnyPublisher()
        }

    /// Request an object
    ///
    /// - Parameters:
    ///   - api: The API
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: An object publisher
    func requestObject<Object: Decodable>(
        from api: API,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Object?, APIError> {
            requestPublisher(from: api)
                .flatMap { self.requestObject(using: $0, promoting: businessErrorTypes) }
                .eraseToAnyPublisher()
        }

    /// Request a list of object
    ///
    /// - Parameters:
    ///   - api: The API
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: An object publisher
    func requestObjects<Object: Decodable>(
        from api: API,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<[Object]?, APIError> {
            requestPublisher(from: api)
                .flatMap { self.requestObjects(using: $0, promoting: businessErrorTypes) }
                .eraseToAnyPublisher()
        }

    /// Request a data
    ///
    /// - Parameters:
    ///   - api: The API
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: An object publisher
    func requestData(
        from api: API,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Data?, APIError> {
            requestPublisher(from: api)
                .flatMap { self.requestData(using: $0, promoting: businessErrorTypes) }
                .eraseToAnyPublisher()
        }

    /// Generate a request publisher
    ///
    /// - Parameters:
    ///   - url: The URL
    ///   - method: The HTTP method
    ///   - header: The HTTP header
    ///   - parameters: The URL parameters
    ///   - body: The request body
    /// - Returns: A request publisher
    private func requestPublisher(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders?,
        and parameters: URLParameters?,
        with body: RequestBody?) -> AnyPublisher<URLRequest, APIError> {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            request.allHTTPHeaderFields = header

            if let parameters = parameters {
                if let url = url.attaching(parameters) {
                    request.url = url
                } else {
                    return Fail<URLRequest, APIError>(error: .url)
                        .eraseToAnyPublisher()
                }
            }

            if let body = body {
                if let contentType = body.contentType {
                    request.allHTTPHeaderFields?[Self.contentTypeKey] = contentType
                }
                if let data = body.data {
                    request.httpBody = data
                } else {
                    return Fail<URLRequest, APIError>(error: .encoding)
                        .eraseToAnyPublisher()
                }
            }

            return Just<URLRequest>(request)
                .mapError(into: APIError.other)
                .eraseToAnyPublisher()
        }

    /// Generate a request publisher
    ///
    /// - Parameter api: The API
    /// - Returns: A request publisher
    private func requestPublisher(from api: API) -> AnyPublisher<URLRequest, APIError> {
        guard let url = URL(string: api.path) else {
            return Fail<URLRequest, APIError>(error: .url).eraseToAnyPublisher()
        }
        return requestPublisher(from: url,
                                using: api.method,
                                attaching: api.headers,
                                and: api.parameters,
                                with: api.body)
    }
}

/// Constants
private extension APIClientType {
    static var contentTypeKey: String { "Content-Type" }
}

import Foundation
import Combine
