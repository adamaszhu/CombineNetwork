/// Decode json data into objects.
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
internal extension AnyPublisher where Output == DataTaskResponse, Failure == APIError {

    /// Decode the response into an object
    func decodeObject<Object: Decodable>() -> AnyPublisher<Object, APIError> {
        tryMap { response in
            do {
                return try JSONDecoder().decode(Object.self, from: response.data)
            } catch {
                throw APIError.decoding
            }
        }
        .mapError(into: APIError.other)
    }

    /// Decode the response into an object array
    func decodeObjects<Object: Decodable>() -> AnyPublisher<[Object], APIError> {
        tryMap { response in
            do {
                return try JSONDecoder().decode([Object].self, from: response.data)
            } catch {
                throw APIError.decoding
            }
        }
        .mapError(into: APIError.other)
    }
}

import Combine
import Foundation
import CombineUtility
