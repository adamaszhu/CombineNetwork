
/// HTTPClient.swift
/// CombineNetwork
///
/// - author: Adamas Zhu
/// - date: 8/11/19
/// - copyright: Copyright © 2019 Adamas Zhu. All rights reserved.

import CombineRx

/// Manage HTTP requests
open class HTTPClient: HTTPClientType {
    
    private let networkConnectionManager: NetworkConnectionManagerType
    private let session: URLSession
    
    /// Intiialize the client
    ///
    /// - Parameters:
    ///   - session: The URLSession configured, including SSL pinning
    ///   - networkConnectionManager: The network connection status manager
    public init(session: URLSession = URLSession.shared,
                networkConnectionManager: NetworkConnectionManagerType = NetworkConnectionManager()) {
        self.networkConnectionManager = networkConnectionManager
        self.session = session
    }
    
    public func requestObject<Object: Decodable>(
        with request: URLRequest,
        promoting businessErrorTypes: [BusinessError.Type] = []) -> AnyPublisher<Object?, HTTPError> {
        guard networkConnectionManager.isConnected else {
            return errorPublisher(of: .network(.connection))
        }
        return session.dataTaskPublisher(for: request)
            .mapNetworkError()
            .catchBusinessError(businessErrorTypes)
            .catchServerError()
            .decodeObject()
    }
    
    public func requestObjects<Object: Decodable>(
        with request: URLRequest,
        promoting businessErrorTypes: [BusinessError.Type] = []) -> AnyPublisher<[Object]?, HTTPError> {
        guard networkConnectionManager.isConnected else {
            return errorPublisher(of: .network(.connection))
        }
        return session.dataTaskPublisher(for: request)
            .mapNetworkError()
            .catchBusinessError(businessErrorTypes)
            .catchServerError()
            .decodeObjects()
    }
    
    public func requestObject<Object: Decodable>(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeader? = nil,
        attaching parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        as bodyType: RequestBodyType? = nil,
        promoting businessErrorTypes: [BusinessError.Type] = []) -> AnyPublisher<Object?, HTTPError> {
        do {
            let request = try self.request(from: url, using: method, attaching: header, attaching: parameters, with: body, as: bodyType)
            return requestObject(with: request, promoting: businessErrorTypes)
        } catch HTTPError.encoding {
            return errorPublisher(of: .encoding)
        } catch HTTPError.url {
            return errorPublisher(of: .url)
        } catch {
            return errorPublisher(of: .unknown)
        }
    }
    
    public func requestObjects<Object: Decodable>(
        from url: URL,
        using method: RequestMethod,
        attaching header: RequestHeader? = nil,
        attaching parameters: URLParameters? = nil,
        with body: RequestBody? = nil,
        as bodyType: RequestBodyType? = nil,
        promoting businessErrorTypes: [BusinessError.Type] = []) -> AnyPublisher<[Object]?, HTTPError> {
        do {
            let request = try self.request(from: url, using: method, attaching: header, attaching: parameters, with: body, as: bodyType)
            return requestObjects(with: request, promoting: businessErrorTypes)
        } catch HTTPError.encoding {
            return errorPublisher(of: .encoding)
        } catch HTTPError.url {
            return errorPublisher(of: .url)
        } catch {
            return errorPublisher(of: .unknown)
        }
    }
    
    private func request(from url: URL,
                         using method: RequestMethod,
                         attaching header: RequestHeader?,
                         attaching parameters: URLParameters?,
                         with body: RequestBody?,
                         as bodyType: RequestBodyType?) throws -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = header
        
        if let parameters = parameters {
            guard let url = url.attaching(parameters) else {
                throw HTTPError.url
            }
            request.url = url
        }
        
        if let body = body, let bodyType = bodyType  {
            request.allHTTPHeaderFields?["Content-Type"] = bodyType.contentType
            guard let data = body.data(as: bodyType) else {
                throw HTTPError.encoding
            }
            request.httpBody = data
        }
        
        return request
    }
    
    private func errorPublisher<T>(of error: HTTPError) -> AnyPublisher<T?, HTTPError> {
        let value: T? = nil
        return Just(value)
            .tryMap { _ in
                throw error
            }
            .eraseToAnyPublisher()
            .mapHTTPError()
    }
}

/// The response type of a HTTP request
public typealias DataTaskResponse = Publishers.DataTaskPublisher.Output



