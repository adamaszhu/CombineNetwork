/// Generic network error thrown by URLSession
///
/// - version: 1.0.0
/// - date: 19/11/22
/// - author: Adamas
public enum NetworkError: Int, Error {

    /// NSURLErrorNotConnectedToInternet
    case connection = -1009

    /// NSURLErrorTimedOut
    case timeout = -1001

    /// NSURLErrorDomain
    case domain = -1022

    case other = 0
    
    /// Convert an error returned by the URLSession into a NetworkError.
    ///
    /// - Parameter code: The returned error.
    public init(error: Error) {
        if let error = error as NSError? {
            self = NetworkError(rawValue: error.code) ?? .other
        } else {
            self = .other
        }
    }
}

import Foundation
