/// ServerError.swift
/// CombineNetwork
///
/// - author: Adamas Zhu
/// - date: 8/11/19
/// - copyright: Copyright © 2019 Adamas Zhu. All rights reserved.

/// Standard HTTP status code error thrown by the server
public enum ServerError: Int, Error {
    
    case badRequestError = 400
    case unauthorized = 401
    case authenticationTimeout = 419
    case unknownResponse = 422
    case internalServer = 500
    case serviceUnavailable = 503
    case gatewayTimeout = 504
    case other = 0
    
    /// Convert a http status code into a ServerError.
    ///
    /// - Parameter code: The http status code.
    public init?(code: Int) {
        if let error = ServerError(rawValue: code) {
            self = error
            return
        }
        if 200..<400 ~= code {
            return nil
        } else {
            self = .other
        }
    }
}
