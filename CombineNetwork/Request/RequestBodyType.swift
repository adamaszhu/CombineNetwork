/// The body type of a HTTP request
///
/// - version: 1.0.0
/// - date: 20/11/22
/// - author: Adamas
public enum RequestBodyType: String {
    case json = "application/json"
    case form = "application/x-www-form-urlencoded"
}
