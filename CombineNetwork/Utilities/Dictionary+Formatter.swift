/// Dictionary+Formatter.swift
/// CombineNetwork
///
/// - author: Adamas Zhu
/// - date: 8/11/19
/// - copyright: Copyright © 2019 Adamas Zhu. All rights reserved.

internal extension Dictionary {
    
    var form: String {
        return map { key, value in
                let key = String(describing: key)
                    .addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? .empty
                let value = String(describing: value)
                    .addingPercentEncoding(withAllowedCharacters: .alphanumerics) ?? .empty
                return key + .equal + value
            }
            .joined(separator: .and)
    }
}
