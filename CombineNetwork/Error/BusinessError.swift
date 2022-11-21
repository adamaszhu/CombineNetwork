/// Any specific business error defined by the HTTP status code and the response.
/// BusinessErrors are detected before checking ServerErrors
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public protocol BusinessError: Error {
    init?(response: DataTaskResponse)
}

/// The response type of a HTTP request
public typealias DataTaskResponse = URLSession.DataTaskPublisher.Output

import Combine
import Foundation
