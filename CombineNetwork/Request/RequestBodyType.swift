/// RequestBodyType.swift
/// CombineNetwork
///
/// - author: Adamas Zhu
/// - date: 8/11/19
/// - copyright: Copyright © 2019 Adamas Zhu. All rights reserved.

/// The body type of a HTTP request
public enum RequestBodyType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
}

public extension RequestBodyType {
    
    /// The contentType field required by a request header
    var contentType: String {
        return rawValue
    }
}
