/// The parameters attached to a URL
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public typealias URLParameters = [(key: String, value: String)]

public extension URLParameters {

    /// Get and set URL parameters for a given key
    subscript(key: String) -> [String] {
        get {
            filter { $0.key == key }
                .map { $0.value }
        }
        set(newValue) {
            removeAll { $0.key == key }
            newValue.forEach { append((key, $0))}
        }
    }

    /// Get and set the URL paramerter for a given key
    subscript(key: String) -> String? {
        get {
            (self[key] as [String]).first
        }
        set(newValue) {
            if let newValue = newValue {
                self[key] = [newValue]
            } else {
                self[key] = []
            }
        }
    }
}
