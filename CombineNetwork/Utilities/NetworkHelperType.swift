/// Defines what a network utility should provide.
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public protocol NetworkHelperType {

    /// If there is a network connection or not
    var isNetworkAvailable: Bool { get }
}
