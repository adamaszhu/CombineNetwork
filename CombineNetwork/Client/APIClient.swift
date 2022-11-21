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
    public init(session: URLSession = .shared,
                networkConnectionManager: NetworkHelperType = NetworkHelper()) {
        self.networkConnectionManager = networkConnectionManager
        self.session = session
    }
    
    public func requestObject<Object: Decodable>(
        using request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<Object?, APIError> {
            dataTaskPublisher(request, promoting: businessErrorTypes)
                .decodeObject()
        }
    
    public func requestObjects<Object: Decodable>(
        using request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type] = []) -> AnyPublisher<[Object]?, APIError> {
            dataTaskPublisher(request, promoting: businessErrorTypes)
                .decodeObjects()
        }
    
    public func requestData(
        using request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type]) -> AnyPublisher<Data?, APIError> {
            dataTaskPublisher(request, promoting: businessErrorTypes)
                .map { $0.data }
                .eraseToAnyPublisher()
        }
    
    /// Generate a standard data task publisher
    /// - Parameters:
    ///   - request: The request to launch
    ///   - businessErrorTypes: All types of BusinessError that should be detected
    /// - Returns: A response publisher
    private func dataTaskPublisher(
        _ request: URLRequest,
        promoting businessErrorTypes: [any BusinessError.Type]) -> AnyPublisher<DataTaskResponse, APIError> {
            guard networkConnectionManager.isNetworkAvailable else {
                return Fail<DataTaskResponse, APIError>(error: .network(.connection))
                    .eraseToAnyPublisher()
            }
            return session.dataTaskPublisher(for: request)
                .detectNetworkError()
                .detectBusinessError(in: businessErrorTypes)
                .detectServerError()
        }
}



import Foundation
import Combine
