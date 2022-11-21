/// Manage HTTP requests
///
/// - version: 1.0.0
/// - date: 21/11/22
/// - author: Adamas
open class APIClient: APIClientType {
    
    private let networkConnectionManager: NetworkHelperType
    private let session: URLSession
    
    /// Intiialize the client
    ///
    /// - Parameters:
    ///   - session: The URLSession configured, including SSL pinning
    ///   - networkConnectionManager: The network connection status manager
    public init(session: URLSession = URLSession.shared,
                networkConnectionManager: NetworkHelperType = NetworkHelper()) {
        self.networkConnectionManager = networkConnectionManager
        self.session = session
    }
    
    public func requestObject<Object: Decodable>(
        with request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Object?, APIError> {
            guard networkConnectionManager.isNetworkAvailable else {
                return Fail<Object?, APIError>(error: .network(.connection))
                    .eraseToAnyPublisher()
            }
            return session.dataTaskPublisher(for: request)
                .detectNetworkError()
                .detectBusinessError(in: businessErrorTypes)
                .detectServerError()
                .decodeObject()
        }
    
    public func requestObjects<Object: Decodable>(
        with request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<[Object]?, APIError> {
            guard networkConnectionManager.isNetworkAvailable else {
                return Fail<[Object]?, APIError>(error: .network(.connection))
                    .eraseToAnyPublisher()
            }
            return session.dataTaskPublisher(for: request)
                .detectNetworkError()
                .detectBusinessError(in: businessErrorTypes)
                .detectServerError()
                .decodeObjects()
        }
    
    public func requestData(
        with request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type]) -> AnyPublisher<Data?, APIError> {
            guard networkConnectionManager.isNetworkAvailable else {
                return Fail<Data?, APIError>(error: .network(.connection))
                    .eraseToAnyPublisher()
            }
            return session.dataTaskPublisher(for: request)
                .detectNetworkError()
                .detectBusinessError(in: businessErrorTypes)
                .detectServerError()
                .map { $0.data }
                .eraseToAnyPublisher()
        }
    
    public func requestObject<Object: Decodable>(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders? = nil,
        attaching parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Object?, APIError> {
            do {
                let request = try self.request(from: url, using: method, attaching: header, attaching: parameters, with: body)
                return requestObject(with: request, promoting: businessErrorTypes)
            } catch APIError.encoding {
                return Fail<Object?, APIError>(error: .encoding)
                    .eraseToAnyPublisher()
            } catch APIError.url {
                return Fail<Object?, APIError>(error: .url)
                    .eraseToAnyPublisher()
            } catch {
                return Fail<Object?, APIError>(error: .other)
                    .eraseToAnyPublisher()
            }
        }
    
    public func requestObjects<Object: Decodable>(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders? = nil,
        attaching parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<[Object]?, APIError> {
            do {
                let request = try self.request(from: url, using: method, attaching: header, attaching: parameters, with: body)
                return requestObjects(with: request, promoting: businessErrorTypes)
            } catch APIError.encoding {
                return Fail<[Object]?, APIError>(error: .encoding)
                    .eraseToAnyPublisher()
            } catch APIError.url {
                return Fail<[Object]?, APIError>(error: .url)
                    .eraseToAnyPublisher()
            } catch {
                return Fail<[Object]?, APIError>(error: .other)
                    .eraseToAnyPublisher()
            }
        }
    
    public func requestData(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeaders?,
        attaching parameters: URLParameters?,
        with body: RequestBody?,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Data?, APIError> {
            do {
                let request = try self.request(from: url, using: method, attaching: header, attaching: parameters, with: body)
                return requestData(with: request, promoting: businessErrorTypes)
            } catch APIError.url {
                return Fail<Data?, APIError>(error: .url)
                    .eraseToAnyPublisher()
            } catch {
                return Fail<Data?, APIError>(error: .other)
                    .eraseToAnyPublisher()
            }
        }
    
    private func request(from url: URL,
                         using method: RequestMethod,
                         attaching header: RequestHeaders?,
                         attaching parameters: URLParameters?,
                         with body: RequestBody?) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
        
        if let parameters = parameters {
            guard let url = url.attaching(parameters) else {
                throw APIError.url
            }
            request.url = url
        }
        
        if let body = body {
            if let contentType = body.contentType {
                request.allHTTPHeaderFields?["Content-Type"] = contentType
            }
            guard let data = body.data else {
                throw APIError.encoding
            }
            request.httpBody = data
        }
        
        return request
    }
}



import Foundation
import Combine
