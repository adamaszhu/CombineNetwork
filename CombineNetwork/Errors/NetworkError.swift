/// NetworkError.swift
/// CombineNetwork
///
/// - author: Adamas Zhu
/// - date: 8/11/19
/// - copyright: Copyright © 2019 Adamas Zhu. All rights reserved.

/// Generic network error thrown by URLSession
public enum NetworkError: Int, Error {
    
    case connection = -1009 // NSURLErrorNotConnectedToInternet
    case timeout = -1001 // NSURLErrorTimedOut
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
