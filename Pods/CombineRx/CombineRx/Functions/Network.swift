/// Network.swift
/// CombineRx
///
/// - author: Adamas Zhu
/// - date: 7/11/19

import RxCocoa
import RxSwift

extension Publishers {
    
    public struct DataTaskPublisher : Publisher {
        
        public let observable: Observable<Output>
        
        /// The kind of values published by this publisher.
        public typealias Output = (data: Data, response: URLResponse)
        
        /// The kind of errors this publisher might publish.
        ///
        /// Use `Never` if this `Publisher` does not publish errors.
        public typealias Failure = URLError
        
        public init(request: URLRequest, session: URLSession) {
            observable = session.rx.response(request: request)
                .map { (data: $0.data, response: $0.response as URLResponse) }
        }
    }
}

extension URLSession {
    
    /// Returns a publisher that wraps a URL session data task for a given URL.
    ///
    /// The publisher publishes data when the task completes, or terminates if the task fails with an error.
    /// - Parameter url: The URL for which to create a data task.
    /// - Returns: A publisher that wraps a data task for the URL.
    public func dataTaskPublisher(for url: URL) -> Publishers.DataTaskPublisher {
        let request = URLRequest(url: url)
        return Publishers.DataTaskPublisher(request: request, session: URLSession.shared)
    }
    
    /// Returns a publisher that wraps a URL session data task for a given URL request.
    ///
    /// The publisher publishes data when the task completes, or terminates if the task fails with an error.
    /// - Parameter request: The URL request for which to create a data task.
    /// - Returns: A publisher that wraps a data task for the URL request.
    public func dataTaskPublisher(for request: URLRequest) -> Publishers.DataTaskPublisher {
        return Publishers.DataTaskPublisher(request: request, session: URLSession.shared)
    }
}

