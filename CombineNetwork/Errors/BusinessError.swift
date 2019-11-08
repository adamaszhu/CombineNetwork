/// BusinessError.swift
/// CombineNetwork
///
/// - author: Adamas Zhu
/// - date: 8/11/19
/// - copyright: Copyright © 2019 Adamas Zhu. All rights reserved.

import CombineRx

/// Any specific business error defined by the HTTP status code and the response.
/// BusinessErrors are detected before checking ServerErrors
public protocol BusinessError: Error {
    init?(response: DataTaskResponse)
}
