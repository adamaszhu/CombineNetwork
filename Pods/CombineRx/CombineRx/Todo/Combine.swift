//import Darwin
//
//extension AnyCancellable {
//
//    /// Stores this AnyCancellable in the specified collection.
//    /// Parameters:
//    ///    - collection: The collection to store this AnyCancellable.
//    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//    final public func store<C>(in collection: inout C) where C : RangeReplaceableCollection, C.Element == AnyCancellable
//
//    /// Stores this AnyCancellable in the specified set.
//    /// Parameters:
//    ///    - collection: The set to store this AnyCancellable.
//    final public func store(in set: inout Set<AnyCancellable>)
//}
//
///// A type-erasing subscriber.
/////
///// Use an `AnySubscriber` to wrap an existing subscriber whose details you don’t want to expose.
///// You can also use `AnySubscriber` to create a custom subscriber by providing closures for `Subscriber`’s methods, rather than implementing `Subscriber` directly.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public struct AnySubscriber<Input, Failure> : Subscriber, CustomStringConvertible, CustomReflectable, CustomPlaygroundDisplayConvertible where Failure : Error {
//
//    public let combineIdentifier: CombineIdentifier
//
//    /// A textual representation of this instance.
//    ///
//    /// Calling this property directly is discouraged. Instead, convert an
//    /// instance of any type to a string by using the `String(describing:)`
//    /// initializer. This initializer works with any type, and uses the custom
//    /// `description` property for types that conform to
//    /// `CustomStringConvertible`:
//    ///
//    ///     struct Point: CustomStringConvertible {
//    ///         let x: Int, y: Int
//    ///
//    ///         var description: String {
//    ///             return "(\(x), \(y))"
//    ///         }
//    ///     }
//    ///
//    ///     let p = Point(x: 21, y: 30)
//    ///     let s = String(describing: p)
//    ///     print(s)
//    ///     // Prints "(21, 30)"
//    ///
//    /// The conversion of `p` to a string in the assignment to `s` uses the
//    /// `Point` type's `description` property.
//    public var description: String { get }
//
//    /// The custom mirror for this instance.
//    ///
//    /// If this type has value semantics, the mirror should be unaffected by
//    /// subsequent mutations of the instance.
//    public var customMirror: Mirror { get }
//
//    /// A custom playground description for this instance.
//    public var playgroundDescription: Any { get }
//
//    /// Creates a type-erasing subscriber to wrap an existing subscriber.
//    ///
//    /// - Parameter s: The subscriber to type-erase.
//    @inlinable public init<S>(_ s: S) where Input == S.Input, Failure == S.Failure, S : Subscriber
//
//    public init<S>(_ s: S) where Input == S.Output, Failure == S.Failure, S : Subject
//
//    /// Creates a type-erasing subscriber that executes the provided closures.
//    ///
//    /// - Parameters:
//    ///   - receiveSubscription: A closure to execute when the subscriber receives the initial subscription from the publisher.
//    ///   - receiveValue: A closure to execute when the subscriber receives a value from the publisher.
//    ///   - receiveCompletion: A closure to execute when the subscriber receives a completion callback from the publisher.
//    @inlinable public init(receiveSubscription: ((Subscription) -> Void)? = nil, receiveValue: ((Input) -> Subscribers.Demand)? = nil, receiveCompletion: ((Subscribers.Completion<Failure>) -> Void)? = nil)
//
//    /// Tells the subscriber that it has successfully subscribed to the publisher and may request items.
//    ///
//    /// Use the received `Subscription` to request items from the publisher.
//    /// - Parameter subscription: A subscription that represents the connection between publisher and subscriber.
//    @inlinable public func receive(subscription: Subscription)
//
//    /// Tells the subscriber that the publisher has produced an element.
//    ///
//    /// - Parameter input: The published element.
//    /// - Returns: A `Demand` instance indicating how many more elements the subcriber expects to receive.
//    @inlinable public func receive(_ value: Input) -> Subscribers.Demand
//
//    /// Tells the subscriber that the publisher has completed publishing, either normally or with an error.
//    ///
//    /// - Parameter completion: A `Completion` case indicating whether publishing completed normally or with an error.
//    @inlinable public func receive(completion: Subscribers.Completion<Failure>)
//}
//
//extension Cancellable {
//
//    /// Stores this Cancellable in the specified collection.
//    /// Parameters:
//    ///    - collection: The collection to store this Cancellable.
//    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//    public func store<C>(in collection: inout C) where C : RangeReplaceableCollection, C.Element == AnyCancellable
//
//    /// Stores this Cancellable in the specified set.
//    /// Parameters:
//    ///    - collection: The set to store this Cancellable.
//    public func store(in set: inout Set<AnyCancellable>)
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public struct CombineIdentifier : Hashable, CustomStringConvertible {
//
//    public init()
//
//    public init(_ obj: AnyObject)
//
//    /// A textual representation of this instance.
//    ///
//    /// Calling this property directly is discouraged. Instead, convert an
//    /// instance of any type to a string by using the `String(describing:)`
//    /// initializer. This initializer works with any type, and uses the custom
//    /// `description` property for types that conform to
//    /// `CustomStringConvertible`:
//    ///
//    ///     struct Point: CustomStringConvertible {
//    ///         let x: Int, y: Int
//    ///
//    ///         var description: String {
//    ///             return "(\(x), \(y))"
//    ///         }
//    ///     }
//    ///
//    ///     let p = Point(x: 21, y: 30)
//    ///     let s = String(describing: p)
//    ///     print(s)
//    ///     // Prints "(21, 30)"
//    ///
//    /// The conversion of `p` to a string in the assignment to `s` uses the
//    /// `Point` type's `description` property.
//    public var description: String { get }
//
//    /// The hash value.
//    ///
//    /// Hash values are not guaranteed to be equal across different executions of
//    /// your program. Do not save hash values to use during a future execution.
//    ///
//    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
//    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
//    public var hashValue: Int { get }
//
//    /// Hashes the essential components of this value by feeding them into the
//    /// given hasher.
//    ///
//    /// Implement this method to conform to the `Hashable` protocol. The
//    /// components used for hashing must be the same as the components compared
//    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//    /// with each of these components.
//    ///
//    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//    ///   compile-time error in the future.
//    ///
//    /// - Parameter hasher: The hasher to use when combining the components
//    ///   of this instance.
//    public func hash(into hasher: inout Hasher)
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (a: CombineIdentifier, b: CombineIdentifier) -> Bool
//}
//
///// A publisher that provides an explicit means of connecting and canceling publication.
/////
///// Use `makeConnectable()` to create a `ConnectablePublisher` from any publisher whose failure type is `Never`.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public protocol ConnectablePublisher : Publisher {
//
//    /// Connects to the publisher and returns a `Cancellable` instance with which to cancel publishing.
//    ///
//    /// - Returns: A `Cancellable` instance that can be used to cancel publishing.
//    func connect() -> Cancellable
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension ConnectablePublisher {
//
//    /// Automates the process of connecting or disconnecting from this connectable publisher.
//    ///
//    /// Use `autoconnect()` to simplify working with `ConnectablePublisher` instances, such as those created with `makeConnectable()`.
//    ///
//    ///     let autoconnectedPublisher = somePublisher
//    ///         .makeConnectable()
//    ///         .autoconnect()
//    ///         .subscribe(someSubscriber)
//    ///
//    /// - Returns: A publisher which automatically connects to its upstream connectable publisher.
//    public func autoconnect() -> Publishers.Autoconnect<Self>
//}
//
///// A publisher that awaits subscription before running the supplied closure to create a publisher for the new subscriber.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public struct Deferred<DeferredPublisher> : Publisher where DeferredPublisher : Publisher {
//
//    /// The kind of values published by this publisher.
//    public typealias Output = DeferredPublisher.Output
//
//    /// The kind of errors this publisher might publish.
//    ///
//    /// Use `Never` if this `Publisher` does not publish errors.
//    public typealias Failure = DeferredPublisher.Failure
//
//    /// The closure to execute when it receives a subscription.
//    ///
//    /// The publisher returned by this closure immediately receives the incoming subscription.
//    public let createPublisher: () -> DeferredPublisher
//
//    /// Creates a deferred publisher.
//    ///
//    /// - Parameter createPublisher: The closure to execute when calling `subscribe(_:)`.
//    public init(createPublisher: @escaping () -> DeferredPublisher)
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    public func receive<S>(subscriber: S) where S : Subscriber, DeferredPublisher.Failure == S.Failure, DeferredPublisher.Output == S.Input
//}
//
///// A publisher that never publishes any values, and optionally finishes immediately.
/////
///// You can create a ”Never” publisher — one which never sends values and never finishes or fails — with the initializer `Empty(completeImmediately: false)`.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public struct Empty<Output, Failure> : Publisher, Equatable where Failure : Error {
//
//    /// Creates an empty publisher.
//    ///
//    /// - Parameter completeImmediately: A Boolean value that indicates whether the publisher should immediately finish.
//    public init(completeImmediately: Bool = true)
//
//    /// Creates an empty publisher with the given completion behavior and output and failure types.
//    ///
//    /// Use this initializer to connect the empty publisher to subscribers or other publishers that have specific output and failure types.
//    /// - Parameters:
//    ///   - completeImmediately: A Boolean value that indicates whether the publisher should immediately finish.
//    ///   - outputType: The output type exposed by this publisher.
//    ///   - failureType: The failure type exposed by this publisher.
//    public init(completeImmediately: Bool = true, outputType: Output.Type, failureType: Failure.Type)
//
//    /// A Boolean value that indicates whether the publisher immediately sends a completion.
//    ///
//    /// If `true`, the publisher finishes immediately after sending a subscription to the subscriber. If `false`, it never completes.
//    public let completeImmediately: Bool
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Empty<Output, Failure>, rhs: Empty<Output, Failure>) -> Bool
//}
//
///// A publisher that immediately terminates with the specified error.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public struct Fail<Output, Failure> : Publisher where Failure : Error {
//
//    /// Creates a publisher that immediately terminates with the specified failure.
//    ///
//    /// - Parameter error: The failure to send when terminating the publisher.
//    public init(error: Failure)
//
//    /// Creates publisher with the given output type, that immediately terminates with the specified failure.
//    ///
//    /// Use this initializer to create a `Fail` publisher that can work with subscribers or publishers that expect a given output type.
//    /// - Parameters:
//    ///   - outputType: The output type exposed by this publisher.
//    ///   - failure: The failure to send when terminating the publisher.
//    public init(outputType: Output.Type, failure: Failure)
//
//    /// The failure to send when terminating the publisher.
//    public let error: Failure
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Fail : Equatable where Failure : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Fail<Output, Failure>, rhs: Fail<Output, Failure>) -> Bool
//}
//
///// A publisher that eventually produces one value and then finishes or fails.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//final public class Future<Output, Failure> : Publisher where Failure : Error {
//
//    public typealias Promise = (Result<Output, Failure>) -> Void
//
//    public init(_ attemptToFulfill: @escaping (@escaping Future<Output, Failure>.Promise) -> Void)
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    final public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Just : Equatable where Output : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Just<Output>, rhs: Just<Output>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Just where Output : Comparable {
//
//    public func min() -> Just<Output>
//
//    public func max() -> Just<Output>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Just where Output : Equatable {
//
//    public func contains(_ output: Output) -> Just<Bool>
//
//    public func removeDuplicates() -> Just<Output>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Just {
//
//    public func allSatisfy(_ predicate: (Output) -> Bool) -> Just<Bool>
//
//    public func tryAllSatisfy(_ predicate: (Output) throws -> Bool) -> Result<Bool, Error>.Publisher
//
//    public func collect() -> Just<[Output]>
//
//    public func compactMap<T>(_ transform: (Output) -> T?) -> Optional<T>.Publisher
//
//    public func min(by areInIncreasingOrder: (Output, Output) -> Bool) -> Just<Output>
//
//    public func max(by areInIncreasingOrder: (Output, Output) -> Bool) -> Just<Output>
//
//    public func prepend(_ elements: Output...) -> Publishers.Sequence<[Output], Just<Output>.Failure>
//
//    public func prepend<S>(_ elements: S) -> Publishers.Sequence<[Output], Just<Output>.Failure> where Output == S.Element, S : Sequence
//
//    public func append(_ elements: Output...) -> Publishers.Sequence<[Output], Just<Output>.Failure>
//
//    public func append<S>(_ elements: S) -> Publishers.Sequence<[Output], Just<Output>.Failure> where Output == S.Element, S : Sequence
//
//    public func contains(where predicate: (Output) -> Bool) -> Just<Bool>
//
//    public func tryContains(where predicate: (Output) throws -> Bool) -> Result<Bool, Error>.Publisher
//
//    public func count() -> Just<Int>
//
//    public func dropFirst(_ count: Int = 1) -> Optional<Output>.Publisher
//
//    public func drop(while predicate: (Output) -> Bool) -> Optional<Output>.Publisher
//
//    public func first() -> Just<Output>
//
//    public func first(where predicate: (Output) -> Bool) -> Optional<Output>.Publisher
//
//    public func last() -> Just<Output>
//
//    public func last(where predicate: (Output) -> Bool) -> Optional<Output>.Publisher
//
//    public func filter(_ isIncluded: (Output) -> Bool) -> Optional<Output>.Publisher
//
//    public func ignoreOutput() -> Empty<Output, Just<Output>.Failure>
//
//    public func map<T>(_ transform: (Output) -> T) -> Just<T>
//
//    public func tryMap<T>(_ transform: (Output) throws -> T) -> Result<T, Error>.Publisher
//
//    public func mapError<E>(_ transform: (Just<Output>.Failure) -> E) -> Result<Output, E>.Publisher where E : Error
//
//    public func output(at index: Int) -> Optional<Output>.Publisher
//
//    public func output<R>(in range: R) -> Optional<Output>.Publisher where R : RangeExpression, R.Bound == Int
//
//    public func prefix(_ maxLength: Int) -> Optional<Output>.Publisher
//
//    public func prefix(while predicate: (Output) -> Bool) -> Optional<Output>.Publisher
//
//    public func reduce<T>(_ initialResult: T, _ nextPartialResult: (T, Output) -> T) -> Result<T, Just<Output>.Failure>.Publisher
//
//    public func tryReduce<T>(_ initialResult: T, _ nextPartialResult: (T, Output) throws -> T) -> Result<T, Error>.Publisher
//
//    public func removeDuplicates(by predicate: (Output, Output) -> Bool) -> Just<Output>
//
//    public func tryRemoveDuplicates(by predicate: (Output, Output) throws -> Bool) -> Result<Output, Error>.Publisher
//
//    public func replaceError(with output: Output) -> Just<Output>
//
//    public func replaceEmpty(with output: Output) -> Just<Output>
//
//    public func retry(_ times: Int) -> Just<Output>
//
//    public func scan<T>(_ initialResult: T, _ nextPartialResult: (T, Output) -> T) -> Result<T, Just<Output>.Failure>.Publisher
//
//    public func tryScan<T>(_ initialResult: T, _ nextPartialResult: (T, Output) throws -> T) -> Result<T, Error>.Publisher
//
//    public func setFailureType<E>(to failureType: E.Type) -> Result<Output, E>.Publisher where E : Error
//}
//
///// A type of object with a publisher that emits before the object has changed.
/////
///// By default an `ObservableObject` will synthesize an `objectWillChange`
///// publisher that emits before any of its `@Published` properties changes:
/////
/////     class Contact: ObservableObject {
/////         @Published var name: String
/////         @Published var age: Int
/////
/////         init(name: String, age: Int) {
/////             self.name = name
/////             self.age = age
/////         }
/////
/////         func haveBirthday() -> Int {
/////             age += 1
/////             return age
/////         }
/////     }
/////
/////     let john = Contact(name: "John Appleseed", age: 24)
/////     john.objectWillChange.sink { _ in print("\(john.age) will change") }
/////     print(john.haveBirthday())
/////     // Prints "24 will change"
/////     // Prints "25"
/////
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//public protocol ObservableObject : AnyObject {
//
//    /// The type of publisher that emits before the object has changed.
//    associatedtype ObjectWillChangePublisher : Publisher = ObservableObjectPublisher where Self.ObjectWillChangePublisher.Failure == Never
//
//    /// A publisher that emits before the object has changed.
//    var objectWillChange: Self.ObjectWillChangePublisher { get }
//}
//
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//extension ObservableObject where Self.ObjectWillChangePublisher == ObservableObjectPublisher {
//
//    /// A publisher that emits before the object has changed.
//    public var objectWillChange: ObservableObjectPublisher { get }
//}
//
///// The default publisher of an `ObservableObject`.
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//final public class ObservableObjectPublisher : Publisher {
//
//    /// The kind of values published by this publisher.
//    public typealias Output = Void
//
//    /// The kind of errors this publisher might publish.
//    ///
//    /// Use `Never` if this `Publisher` does not publish errors.
//    public typealias Failure = Never
//
//    public init()
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    final public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == ObservableObjectPublisher.Failure, S.Input == ObservableObjectPublisher.Output
//
//    final public func send()
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//final public class PassthroughSubject<Output, Failure> : Subject where Failure : Error {
//
//    public init()
//
//    /// Provides this Subject an opportunity to establish demand for any new upstream subscriptions (say via, ```Publisher.subscribe<S: Subject>(_: Subject)`
//    final public func send(subscription: Subscription)
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    final public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber
//
//    /// Sends a value to the subscriber.
//    ///
//    /// - Parameter value: The value to send.
//    final public func send(_ input: Output)
//
//    /// Sends a completion signal to the subscriber.
//    ///
//    /// - Parameter completion: A `Completion` instance which indicates whether publishing has finished normally or failed with an error.
//    final public func send(completion: Subscribers.Completion<Failure>)
//}
//
///// Adds a `Publisher` to a property.
/////
///// Properties annotated with `@Published` contain both the stored value and a publisher which sends any new values after the property value has been sent. New subscribers will receive the current value of the property first.
///// Note that the `@Published` property is class-constrained. Use it with properties of classes, not with non-class types like structures.
//@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
//@propertyWrapper public struct Published<Value> {
//
//    /// Initialize the storage of the Published property as well as the corresponding `Publisher`.
//    public init(initialValue: Value)
//
//    /// A publisher for properties marked with the `@Published` attribute.
//    public struct Publisher : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Value
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Never
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Value == S.Input, S : Subscriber, S.Failure == Published<Value>.Publisher.Failure
//    }
//
//    /// The property that can be accessed with the `$` syntax and allows access to the `Publisher`
//    public var projectedValue: Published<Value>.Publisher { mutating get }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Applies a closure to create a subject that delivers elements to subscribers.
//    ///
//    /// Use a multicast publisher when you have multiple downstream subscribers, but you want upstream publishers to only process one `receive(_:)` call per event.
//    /// In contrast with `multicast(subject:)`, this method produces a publisher that creates a separate Subject for each subscriber.
//    /// - Parameter createSubject: A closure to create a new Subject each time a subscriber attaches to the multicast publisher.
//    public func multicast<S>(_ createSubject: @escaping () -> S) -> Publishers.Multicast<Self, S> where S : Subject, Self.Failure == S.Failure, Self.Output == S.Output
//
//    /// Provides a subject to deliver elements to multiple subscribers.
//    ///
//    /// Use a multicast publisher when you have multiple downstream subscribers, but you want upstream publishers to only process one `receive(_:)` call per event.
//    /// In contrast with `multicast(_:)`, this method produces a publisher shares the provided Subject among all the downstream subscribers.
//    /// - Parameter subject: A subject to deliver elements to downstream subscribers.
//    public func multicast<S>(subject: S) -> Publishers.Multicast<Self, S> where S : Subject, Self.Failure == S.Failure, Self.Output == S.Output
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Specifies the scheduler on which to perform subscribe, cancel, and request operations.
//    ///
//    /// In contrast with `receive(on:options:)`, which affects downstream messages, `subscribe(on:)` changes the execution context of upstream messages. In the following example, requests to `jsonPublisher` are performed on `backgroundQueue`, but elements received from it are performed on `RunLoop.main`.
//    ///
//    ///     let ioPerformingPublisher == // Some publisher.
//    ///     let uiUpdatingSubscriber == // Some subscriber that updates the UI.
//    ///
//    ///     ioPerformingPublisher
//    ///         .subscribe(on: backgroundQueue)
//    ///         .receiveOn(on: RunLoop.main)
//    ///         .subscribe(uiUpdatingSubscriber)
//    ///
//    /// - Parameters:
//    ///   - scheduler: The scheduler on which to receive upstream messages.
//    ///   - options: Options that customize the delivery of elements.
//    /// - Returns: A publisher which performs upstream operations on the specified scheduler.
//    public func subscribe<S>(on scheduler: S, options: S.SchedulerOptions? = nil) -> Publishers.SubscribeOn<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Measures and emits the time interval between events received from an upstream publisher.
//    ///
//    /// The output type of the returned scheduler is the time interval of the provided scheduler.
//    /// - Parameters:
//    ///   - scheduler: The scheduler on which to deliver elements.
//    ///   - options: Options that customize the delivery of elements.
//    /// - Returns: A publisher that emits elements representing the time interval between the elements it receives.
//    public func measureInterval<S>(using scheduler: S, options: S.SchedulerOptions? = nil) -> Publishers.MeasureInterval<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Omits elements from the upstream publisher until a given closure returns false, before republishing all remaining elements.
//    ///
//    /// - Parameter predicate: A closure that takes an element as a parameter and returns a Boolean
//    /// value indicating whether to drop the element from the publisher’s output.
//    /// - Returns: A publisher that skips over elements until the provided closure returns `false`.
//    public func drop(while predicate: @escaping (Self.Output) -> Bool) -> Publishers.DropWhile<Self>
//
//    /// Omits elements from the upstream publisher until an error-throwing closure returns false, before republishing all remaining elements.
//    ///
//    /// If the predicate closure throws, the publisher fails with an error.
//    ///
//    /// - Parameter predicate: A closure that takes an element as a parameter and returns a Boolean value indicating whether to drop the element from the publisher’s output.
//    /// - Returns: A publisher that skips over elements until the provided closure returns `false`, and then republishes all remaining elements. If the predicate closure throws, the publisher fails with an error.
//    public func tryDrop(while predicate: @escaping (Self.Output) throws -> Bool) -> Publishers.TryDropWhile<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Republishes all elements that match a provided closure.
//    ///
//    /// - Parameter isIncluded: A closure that takes one element and returns a Boolean value indicating whether to republish the element.
//    /// - Returns: A publisher that republishes all elements that satisfy the closure.
//    public func filter(_ isIncluded: @escaping (Self.Output) -> Bool) -> Publishers.Filter<Self>
//
//    /// Republishes all elements that match a provided error-throwing closure.
//    ///
//    /// If the `isIncluded` closure throws an error, the publisher fails with that error.
//    ///
//    /// - Parameter isIncluded:  A closure that takes one element and returns a Boolean value indicating whether to republish the element.
//    /// - Returns:  A publisher that republishes all elements that satisfy the closure.
//    public func tryFilter(_ isIncluded: @escaping (Self.Output) throws -> Bool) -> Publishers.TryFilter<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Raises a debugger signal when a provided closure needs to stop the process in the debugger.
//    ///
//    /// When any of the provided closures returns `true`, this publisher raises the `SIGTRAP` signal to stop the process in the debugger.
//    /// Otherwise, this publisher passes through values and completions as-is.
//    ///
//    /// - Parameters:
//    ///   - receiveSubscription: A closure that executes when when the publisher receives a subscription. Return `true` from this closure to raise `SIGTRAP`, or false to continue.
//    ///   - receiveOutput: A closure that executes when when the publisher receives a value. Return `true` from this closure to raise `SIGTRAP`, or false to continue.
//    ///   - receiveCompletion: A closure that executes when when the publisher receives a completion. Return `true` from this closure to raise `SIGTRAP`, or false to continue.
//    /// - Returns: A publisher that raises a debugger signal when one of the provided closures returns `true`.
//    public func breakpoint(receiveSubscription: ((Subscription) -> Bool)? = nil, receiveOutput: ((Self.Output) -> Bool)? = nil, receiveCompletion: ((Subscribers.Completion<Self.Failure>) -> Bool)? = nil) -> Publishers.Breakpoint<Self>
//
//    /// Raises a debugger signal upon receiving a failure.
//    ///
//    /// When the upstream publisher fails with an error, this publisher raises the `SIGTRAP` signal, which stops the process in the debugger.
//    /// Otherwise, this publisher passes through values and completions as-is.
//    /// - Returns: A publisher that raises a debugger signal upon receiving a failure.
//    public func breakpointOnError() -> Publishers.Breakpoint<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes a single Boolean value that indicates whether all received elements pass a given predicate.
//    ///
//    /// When this publisher receives an element, it runs the predicate against the element. If the predicate returns `false`, the publisher produces a `false` value and finishes. If the upstream publisher finishes normally, this publisher produces a `true` value and finishes.
//    /// As a `reduce`-style operator, this publisher produces at most one value.
//    /// Backpressure note: Upon receiving any request greater than zero, this publisher requests unlimited elements from the upstream publisher.
//    /// - Parameter predicate: A closure that evaluates each received element. Return `true` to continue, or `false` to cancel the upstream and complete.
//    /// - Returns: A publisher that publishes a Boolean value that indicates whether all received elements pass a given predicate.
//    public func allSatisfy(_ predicate: @escaping (Self.Output) -> Bool) -> Publishers.AllSatisfy<Self>
//
//    /// Publishes a single Boolean value that indicates whether all received elements pass a given error-throwing predicate.
//    ///
//    /// When this publisher receives an element, it runs the predicate against the element. If the predicate returns `false`, the publisher produces a `false` value and finishes. If the upstream publisher finishes normally, this publisher produces a `true` value and finishes. If the predicate throws an error, the publisher fails, passing the error to its downstream.
//    /// As a `reduce`-style operator, this publisher produces at most one value.
//    /// Backpressure note: Upon receiving any request greater than zero, this publisher requests unlimited elements from the upstream publisher.
//    /// - Parameter predicate:  A closure that evaluates each received element. Return `true` to continue, or `false` to cancel the upstream and complete. The closure may throw, in which case the publisher cancels the upstream publisher and fails with the thrown error.
//    /// - Returns:  A publisher that publishes a Boolean value that indicates whether all received elements pass a given predicate.
//    public func tryAllSatisfy(_ predicate: @escaping (Self.Output) throws -> Bool) -> Publishers.TryAllSatisfy<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Failure == Never {
//
//    /// Attaches a subscriber with closure-based behavior.
//    ///
//    /// This method creates the subscriber and immediately requests an unlimited number of values, prior to returning the subscriber.
//    /// - parameter receiveValue: The closure to execute on receipt of a value.
//    /// - Returns: A cancellable instance; used when you end assignment of the received value. Deallocation of the result will tear down the subscription stream.
//    public func sink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Output : Equatable {
//
//    /// Publishes only elements that don’t match the previous element.
//    ///
//    /// - Returns: A publisher that consumes — rather than publishes — duplicate elements.
//    public func removeDuplicates() -> Publishers.RemoveDuplicates<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes only elements that don’t match the previous element, as evaluated by a provided closure.
//    /// - Parameter predicate: A closure to evaluate whether two elements are equivalent, for purposes of filtering. Return `true` from this closure to indicate that the second element is a duplicate of the first.
//    public func removeDuplicates(by predicate: @escaping (Self.Output, Self.Output) -> Bool) -> Publishers.RemoveDuplicates<Self>
//
//    /// Publishes only elements that don’t match the previous element, as evaluated by a provided error-throwing closure.
//    /// - Parameter predicate: A closure to evaluate whether two elements are equivalent, for purposes of filtering. Return `true` from this closure to indicate that the second element is a duplicate of the first. If this closure throws an error, the publisher terminates with the thrown error.
//    public func tryRemoveDuplicates(by predicate: @escaping (Self.Output, Self.Output) throws -> Bool) -> Publishers.TryRemoveDuplicates<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Output : Equatable {
//
//    /// Publishes a Boolean value upon receiving an element equal to the argument.
//    ///
//    /// The contains publisher consumes all received elements until the upstream publisher produces a matching element. At that point, it emits `true` and finishes normally. If the upstream finishes normally without producing a matching element, this publisher emits `false`, then finishes.
//    /// - Parameter output: An element to match against.
//    /// - Returns: A publisher that emits the Boolean value `true` when the upstream publisher emits a matching value.
//    public func contains(_ output: Self.Output) -> Publishers.Contains<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Subscribes to an additional publisher and publishes a tuple upon receiving output from either publisher.
//    ///
//    /// The combined publisher passes through any requests to *all* upstream publishers. However, it still obeys the demand-fulfilling rule of only sending the request amount downstream. If the demand isn’t `.unlimited`, it drops values from upstream publishers. It implements this by using a buffer size of 1 for each upstream, and holds the most recent value in each buffer.
//    /// All upstream publishers need to finish for this publisher to finsh. If an upstream publisher never publishes a value, this publisher never finishes.
//    /// If any of the combined publishers terminates with a failure, this publisher also fails.
//    /// - Parameters:
//    ///   - other: Another publisher to combine with this one.
//    /// - Returns: A publisher that receives and combines elements from this and another publisher.
//    public func combineLatest<P>(_ other: P) -> Publishers.CombineLatest<Self, P> where P : Publisher, Self.Failure == P.Failure
//
//    /// Subscribes to an additional publisher and invokes a closure upon receiving output from either publisher.
//    ///
//    /// The combined publisher passes through any requests to *all* upstream publishers. However, it still obeys the demand-fulfilling rule of only sending the request amount downstream. If the demand isn’t `.unlimited`, it drops values from upstream publishers. It implements this by using a buffer size of 1 for each upstream, and holds the most recent value in each buffer.
//    /// All upstream publishers need to finish for this publisher to finsh. If an upstream publisher never publishes a value, this publisher never finishes.
//    /// If any of the combined publishers terminates with a failure, this publisher also fails.
//    /// - Parameters:
//    ///   - other: Another publisher to combine with this one.
//    ///   - transform: A closure that receives the most recent value from each publisher and returns a new value to publish.
//    /// - Returns: A publisher that receives and combines elements from this and another publisher.
//    public func combineLatest<P, T>(_ other: P, _ transform: @escaping (Self.Output, P.Output) -> T) -> Publishers.Map<Publishers.CombineLatest<Self, P>, T> where P : Publisher, Self.Failure == P.Failure
//
//    /// Subscribes to two additional publishers and publishes a tuple upon receiving output from any of the publishers.
//    ///
//    /// The combined publisher passes through any requests to *all* upstream publishers. However, it still obeys the demand-fulfilling rule of only sending the request amount downstream. If the demand isn’t `.unlimited`, it drops values from upstream publishers. It implements this by using a buffer size of 1 for each upstream, and holds the most recent value in each buffer.
//    /// All upstream publishers need to finish for this publisher to finish. If an upstream publisher never publishes a value, this publisher never finishes.
//    /// If any of the combined publishers terminates with a failure, this publisher also fails.
//    /// - Parameters:
//    ///   - publisher1: A second publisher to combine with this one.
//    ///   - publisher2: A third publisher to combine with this one.
//    /// - Returns: A publisher that receives and combines elements from this publisher and two other publishers.
//    public func combineLatest<P, Q>(_ publisher1: P, _ publisher2: Q) -> Publishers.CombineLatest3<Self, P, Q> where P : Publisher, Q : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure
//
//    /// Subscribes to two additional publishers and invokes a closure upon receiving output from any of the publishers.
//    ///
//    /// The combined publisher passes through any requests to *all* upstream publishers. However, it still obeys the demand-fulfilling rule of only sending the request amount downstream. If the demand isn’t `.unlimited`, it drops values from upstream publishers. It implements this by using a buffer size of 1 for each upstream, and holds the most recent value in each buffer.
//    /// All upstream publishers need to finish for this publisher to finish. If an upstream publisher never publishes a value, this publisher never finishes.
//    /// If any of the combined publishers terminates with a failure, this publisher also fails.
//    /// - Parameters:
//    ///   - publisher1: A second publisher to combine with this one.
//    ///   - publisher2: A third publisher to combine with this one.
//    ///   - transform: A closure that receives the most recent value from each publisher and returns a new value to publish.
//    /// - Returns: A publisher that receives and combines elements from this publisher and two other publishers.
//    public func combineLatest<P, Q, T>(_ publisher1: P, _ publisher2: Q, _ transform: @escaping (Self.Output, P.Output, Q.Output) -> T) -> Publishers.Map<Publishers.CombineLatest3<Self, P, Q>, T> where P : Publisher, Q : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure
//
//    /// Subscribes to three additional publishers and publishes a tuple upon receiving output from any of the publishers.
//    ///
//    /// The combined publisher passes through any requests to *all* upstream publishers. However, it still obeys the demand-fulfilling rule of only sending the request amount downstream. If the demand isn’t `.unlimited`, it drops values from upstream publishers. It implements this by using a buffer size of 1 for each upstream, and holds the most recent value in each buffer.
//    /// All upstream publishers need to finish for this publisher to finish. If an upstream publisher never publishes a value, this publisher never finishes.
//    /// If any of the combined publishers terminates with a failure, this publisher also fails.
//    /// - Parameters:
//    ///   - publisher1: A second publisher to combine with this one.
//    ///   - publisher2: A third publisher to combine with this one.
//    ///   - publisher3: A fourth publisher to combine with this one.
//    /// - Returns: A publisher that receives and combines elements from this publisher and three other publishers.
//    public func combineLatest<P, Q, R>(_ publisher1: P, _ publisher2: Q, _ publisher3: R) -> Publishers.CombineLatest4<Self, P, Q, R> where P : Publisher, Q : Publisher, R : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure, Q.Failure == R.Failure
//
//    /// Subscribes to three additional publishers and invokes a closure upon receiving output from any of the publishers.
//    ///
//    /// The combined publisher passes through any requests to *all* upstream publishers. However, it still obeys the demand-fulfilling rule of only sending the request amount downstream. If the demand isn’t `.unlimited`, it drops values from upstream publishers. It implements this by using a buffer size of 1 for each upstream, and holds the most recent value in each buffer.
//    /// All upstream publishers need to finish for this publisher to finish. If an upstream publisher never publishes a value, this publisher never finishes.
//    /// If any of the combined publishers terminates with a failure, this publisher also fails.
//    /// - Parameters:
//    ///   - publisher1: A second publisher to combine with this one.
//    ///   - publisher2: A third publisher to combine with this one.
//    ///   - publisher3: A fourth publisher to combine with this one.
//    ///   - transform: A closure that receives the most recent value from each publisher and returns a new value to publish.
//    /// - Returns: A publisher that receives and combines elements from this publisher and three other publishers.
//    public func combineLatest<P, Q, R, T>(_ publisher1: P, _ publisher2: Q, _ publisher3: R, _ transform: @escaping (Self.Output, P.Output, Q.Output, R.Output) -> T) -> Publishers.Map<Publishers.CombineLatest4<Self, P, Q, R>, T> where P : Publisher, Q : Publisher, R : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure, Q.Failure == R.Failure
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Republishes elements up to the specified maximum count.
//    ///
//    /// - Parameter maxLength: The maximum number of elements to republish.
//    /// - Returns: A publisher that publishes up to the specified number of elements before completing.
//    public func prefix(_ maxLength: Int) -> Publishers.Output<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Prints log messages for all publishing events.
//    ///
//    /// - Parameter prefix: A string with which to prefix all log messages. Defaults to an empty string.
//    /// - Returns: A publisher that prints log messages for all publishing events.
//    public func print(_ prefix: String = "", to stream: TextOutputStream? = nil) -> Publishers.Print<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Republishes elements while a predicate closure indicates publishing should continue.
//    ///
//    /// The publisher finishes when the closure returns `false`.
//    ///
//    /// - Parameter predicate: A closure that takes an element as its parameter and returns a Boolean value indicating whether publishing should continue.
//    /// - Returns: A publisher that passes through elements until the predicate indicates publishing should finish.
//    public func prefix(while predicate: @escaping (Self.Output) -> Bool) -> Publishers.PrefixWhile<Self>
//
//    /// Republishes elements while a error-throwing predicate closure indicates publishing should continue.
//    ///
//    /// The publisher finishes when the closure returns `false`. If the closure throws, the publisher fails with the thrown error.
//    ///
//    /// - Parameter predicate: A closure that takes an element as its parameter and returns a Boolean value indicating whether publishing should continue.
//    /// - Returns: A publisher that passes through elements until the predicate throws or indicates publishing should finish.
//    public func tryPrefix(while predicate: @escaping (Self.Output) throws -> Bool) -> Publishers.TryPrefixWhile<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Failure == Never {
//
//    /// Changes the failure type declared by the upstream publisher.
//    ///
//    /// The publisher returned by this method cannot actually fail with the specified type and instead just finishes normally. Instead, you use this method when you need to match the error types of two mismatched publishers.
//    ///
//    /// - Parameter failureType: The `Failure` type presented by this publisher.
//    /// - Returns: A publisher that appears to send the specified failure type.
//    public func setFailureType<E>(to failureType: E.Type) -> Publishers.SetFailureType<Self, E> where E : Error
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes a Boolean value upon receiving an element that satisfies the predicate closure.
//    ///
//    /// This operator consumes elements produced from the upstream publisher until the upstream publisher produces a matching element.
//    /// - Parameter predicate: A closure that takes an element as its parameter and returns a Boolean value indicating whether the element satisfies the closure’s comparison logic.
//    /// - Returns: A publisher that emits the Boolean value `true` when the upstream  publisher emits a matching value.
//    public func contains(where predicate: @escaping (Self.Output) -> Bool) -> Publishers.ContainsWhere<Self>
//
//    /// Publishes a Boolean value upon receiving an element that satisfies the throwing predicate closure.
//    ///
//    /// This operator consumes elements produced from the upstream publisher until the upstream publisher produces a matching element. If the closure throws, the stream fails with an error.
//    /// - Parameter predicate: A closure that takes an element as its parameter and returns a Boolean value indicating whether the element satisfies the closure’s comparison logic.
//    /// - Returns: A publisher that emits the Boolean value `true` when the upstream publisher emits a matching value.
//    public func tryContains(where predicate: @escaping (Self.Output) throws -> Bool) -> Publishers.TryContainsWhere<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Failure == Never {
//
//    /// Creates a connectable wrapper around the publisher.
//    ///
//    /// - Returns: A `ConnectablePublisher` wrapping this publisher.
//    public func makeConnectable() -> Publishers.MakeConnectable<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Collects all received elements, and emits a single array of the collection when the upstream publisher finishes.
//    ///
//    /// If the upstream publisher fails with an error, this publisher forwards the error to the downstream receiver instead of sending its output.
//    /// This publisher requests an unlimited number of elements from the upstream publisher. It only sends the collected array to its downstream after a request whose demand is greater than 0 items.
//    /// Note: This publisher uses an unbounded amount of memory to store the received values.
//    ///
//    /// - Returns: A publisher that collects all received items and returns them as an array upon completion.
//    public func collect() -> Publishers.Collect<Self>
//
//    /// Collects up to the specified number of elements, and then emits a single array of the collection.
//    ///
//    /// If the upstream publisher finishes before filling the buffer, this publisher sends an array of all the items it has received. This may be fewer than `count` elements.
//    /// If the upstream publisher fails with an error, this publisher forwards the error to the downstream receiver instead of sending its output.
//    /// Note: When this publisher receives a request for `.max(n)` elements, it requests `.max(count * n)` from the upstream publisher.
//    /// - Parameter count: The maximum number of received elements to buffer before publishing.
//    /// - Returns: A publisher that collects up to the specified number of elements, and then publishes them as an array.
//    public func collect(_ count: Int) -> Publishers.CollectByCount<Self>
//
//    /// Collects elements by a given strategy, and emits a single array of the collection.
//    ///
//    /// If the upstream publisher finishes before filling the buffer, this publisher sends an array of all the items it has received. This may be fewer than `count` elements.
//    /// If the upstream publisher fails with an error, this publisher forwards the error to the downstream receiver instead of sending its output.
//    /// Note: When this publisher receives a request for `.max(n)` elements, it requests `.max(count * n)` from the upstream publisher.
//    /// - Parameters:
//    ///   - strategy: The strategy with which to collect and publish elements.
//    ///   - options: `Scheduler` options to use for the strategy.
//    /// - Returns: A publisher that collects elements by a given strategy, and emits a single array of the collection.
//    public func collect<S>(_ strategy: Publishers.TimeGroupingStrategy<S>, options: S.SchedulerOptions? = nil) -> Publishers.CollectByTime<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Returns a publisher that publishes the value of a key path.
//    ///
//    /// - Parameter keyPath: The key path of a property on `Output`
//    /// - Returns: A publisher that publishes the value of the key path.
//    public func map<T>(_ keyPath: KeyPath<Self.Output, T>) -> Publishers.MapKeyPath<Self, T>
//
//    /// Returns a publisher that publishes the values of two key paths as a tuple.
//    ///
//    /// - Parameters:
//    ///   - keyPath0: The key path of a property on `Output`
//    ///   - keyPath1: The key path of another property on `Output`
//    /// - Returns: A publisher that publishes the values of two key paths as a tuple.
//    public func map<T0, T1>(_ keyPath0: KeyPath<Self.Output, T0>, _ keyPath1: KeyPath<Self.Output, T1>) -> Publishers.MapKeyPath2<Self, T0, T1>
//
//    /// Returns a publisher that publishes the values of three key paths as a tuple.
//    ///
//    /// - Parameters:
//    ///   - keyPath0: The key path of a property on `Output`
//    ///   - keyPath1: The key path of another property on `Output`
//    ///   - keyPath2: The key path of a third  property on `Output`
//    /// - Returns: A publisher that publishes the values of three key paths as a tuple.
//    public func map<T0, T1, T2>(_ keyPath0: KeyPath<Self.Output, T0>, _ keyPath1: KeyPath<Self.Output, T1>, _ keyPath2: KeyPath<Self.Output, T2>) -> Publishers.MapKeyPath3<Self, T0, T1, T2>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Republishes elements until another publisher emits an element.
//    ///
//    /// After the second publisher publishes an element, the publisher returned by this method finishes.
//    ///
//    /// - Parameter publisher: A second publisher.
//    /// - Returns: A publisher that republishes elements until the second publisher publishes an element.
//    public func prefix<P>(untilOutputFrom publisher: P) -> Publishers.PrefixUntilOutput<Self, P> where P : Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    public func subscribe<S>(_ subject: S) -> AnyCancellable where S : Subject, Self.Failure == S.Failure, Self.Output == S.Output
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Applies a closure that accumulates each element of a stream and publishes a final result upon completion.
//    ///
//    /// - Parameters:
//    ///   - initialResult: The value the closure receives the first time it is called.
//    ///   - nextPartialResult: A closure that takes the previously-accumulated value and the next element from the upstream publisher to produce a new value.
//    /// - Returns: A publisher that applies the closure to all received elements and produces an accumulated value when the upstream publisher finishes.
//    public func reduce<T>(_ initialResult: T, _ nextPartialResult: @escaping (T, Self.Output) -> T) -> Publishers.Reduce<Self, T>
//
//    /// Applies an error-throwing closure that accumulates each element of a stream and publishes a final result upon completion.
//    ///
//    /// If the closure throws an error, the publisher fails, passing the error to its subscriber.
//    /// - Parameters:
//    ///   - initialResult: The value the closure receives the first time it is called.
//    ///   - nextPartialResult: An error-throwing closure that takes the previously-accumulated value and the next element from the upstream publisher to produce a new value.
//    /// - Returns: A publisher that applies the closure to all received elements and produces an accumulated value when the upstream publisher finishes.
//    public func tryReduce<T>(_ initialResult: T, _ nextPartialResult: @escaping (T, Self.Output) throws -> T) -> Publishers.TryReduce<Self, T>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Calls a closure with each received element and publishes any returned optional that has a value.
//    ///
//    /// - Parameter transform: A closure that receives a value and returns an optional value.
//    /// - Returns: A publisher that republishes all non-`nil` results of calling the transform closure.
//    public func compactMap<T>(_ transform: @escaping (Self.Output) -> T?) -> Publishers.CompactMap<Self, T>
//
//    /// Calls an error-throwing closure with each received element and publishes any returned optional that has a value.
//    ///
//    /// If the closure throws an error, the publisher cancels the upstream and sends the thrown error to the downstream receiver as a `Failure`.
//    /// - Parameter transform: an error-throwing closure that receives a value and returns an optional value.
//    /// - Returns: A publisher that republishes all non-`nil` results of calling the transform closure.
//    public func tryCompactMap<T>(_ transform: @escaping (Self.Output) throws -> T?) -> Publishers.TryCompactMap<Self, T>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Combines elements from this publisher with those from another publisher, delivering an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    /// - Parameter other: Another publisher.
//    /// - Returns: A publisher that emits an event when either upstream publisher emits an event.
//    public func merge<P>(with other: P) -> Publishers.Merge<Self, P> where P : Publisher, Self.Failure == P.Failure, Self.Output == P.Output
//
//    /// Combines elements from this publisher with those from two other publishers, delivering an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    ///
//    /// - Parameters:
//    ///   - b: A second publisher.
//    ///   - c: A third publisher.
//    /// - Returns:  A publisher that emits an event when any upstream publisher emits
//    /// an event.
//    public func merge<B, C>(with b: B, _ c: C) -> Publishers.Merge3<Self, B, C> where B : Publisher, C : Publisher, Self.Failure == B.Failure, Self.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output
//
//    /// Combines elements from this publisher with those from three other publishers, delivering
//    /// an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    ///
//    /// - Parameters:
//    ///   - b: A second publisher.
//    ///   - c: A third publisher.
//    ///   - d: A fourth publisher.
//    /// - Returns: A publisher that emits an event when any upstream publisher emits an event.
//    public func merge<B, C, D>(with b: B, _ c: C, _ d: D) -> Publishers.Merge4<Self, B, C, D> where B : Publisher, C : Publisher, D : Publisher, Self.Failure == B.Failure, Self.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output
//
//    /// Combines elements from this publisher with those from four other publishers, delivering an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    ///
//    /// - Parameters:
//    ///   - b: A second publisher.
//    ///   - c: A third publisher.
//    ///   - d: A fourth publisher.
//    ///   - e: A fifth publisher.
//    /// - Returns: A publisher that emits an event when any upstream publisher emits an event.
//    public func merge<B, C, D, E>(with b: B, _ c: C, _ d: D, _ e: E) -> Publishers.Merge5<Self, B, C, D, E> where B : Publisher, C : Publisher, D : Publisher, E : Publisher, Self.Failure == B.Failure, Self.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output
//
//    /// Combines elements from this publisher with those from five other publishers, delivering an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    ///
//    /// - Parameters:
//    ///   - b: A second publisher.
//    ///   - c: A third publisher.
//    ///   - d: A fourth publisher.
//    ///   - e: A fifth publisher.
//    ///   - f: A sixth publisher.
//    /// - Returns: A publisher that emits an event when any upstream publisher emits an event.
//    public func merge<B, C, D, E, F>(with b: B, _ c: C, _ d: D, _ e: E, _ f: F) -> Publishers.Merge6<Self, B, C, D, E, F> where B : Publisher, C : Publisher, D : Publisher, E : Publisher, F : Publisher, Self.Failure == B.Failure, Self.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output, E.Failure == F.Failure, E.Output == F.Output
//
//    /// Combines elements from this publisher with those from six other publishers, delivering an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    ///
//    /// - Parameters:
//    ///   - b: A second publisher.
//    ///   - c: A third publisher.
//    ///   - d: A fourth publisher.
//    ///   - e: A fifth publisher.
//    ///   - f: A sixth publisher.
//    ///   - g: A seventh publisher.
//    /// - Returns: A publisher that emits an event when any upstream publisher emits an event.
//    public func merge<B, C, D, E, F, G>(with b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G) -> Publishers.Merge7<Self, B, C, D, E, F, G> where B : Publisher, C : Publisher, D : Publisher, E : Publisher, F : Publisher, G : Publisher, Self.Failure == B.Failure, Self.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output, E.Failure == F.Failure, E.Output == F.Output, F.Failure == G.Failure, F.Output == G.Output
//
//    /// Combines elements from this publisher with those from seven other publishers, delivering an interleaved sequence of elements.
//    ///
//    /// The merged publisher continues to emit elements until all upstream publishers finish. If an upstream publisher produces an error, the merged publisher fails with that error.
//    ///
//    /// - Parameters:
//    ///   - b: A second publisher.
//    ///   - c: A third publisher.
//    ///   - d: A fourth publisher.
//    ///   - e: A fifth publisher.
//    ///   - f: A sixth publisher.
//    ///   - g: A seventh publisher.
//    ///   - h: An eighth publisher.
//    /// - Returns: A publisher that emits an event when any upstream publisher emits an event.
//    public func merge<B, C, D, E, F, G, H>(with b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H) -> Publishers.Merge8<Self, B, C, D, E, F, G, H> where B : Publisher, C : Publisher, D : Publisher, E : Publisher, F : Publisher, G : Publisher, H : Publisher, Self.Failure == B.Failure, Self.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output, E.Failure == F.Failure, E.Output == F.Output, F.Failure == G.Failure, F.Output == G.Output, G.Failure == H.Failure, G.Output == H.Output
//
//    /// Combines elements from this publisher with those from another publisher of the same type, delivering an interleaved sequence of elements.
//    ///
//    /// - Parameter other: Another publisher of this publisher's type.
//    /// - Returns: A publisher that emits an event when either upstream publisher emits
//    /// an event.
//    public func merge(with other: Self) -> Publishers.MergeMany<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Transforms elements from the upstream publisher by providing the current element to a closure along with the last value returned by the closure.
//    ///
//    ///     let pub = (0...5)
//    ///         .publisher
//    ///         .scan(0, { return $0 + $1 })
//    ///         .sink(receiveValue: { print ("\($0)", terminator: " ") })
//    ///      // Prints "0 1 3 6 10 15 ".
//    ///
//    ///
//    /// - Parameters:
//    ///   - initialResult: The previous result returned by the `nextPartialResult` closure.
//    ///   - nextPartialResult: A closure that takes as its arguments the previous value returned by the closure and the next element emitted from the upstream publisher.
//    /// - Returns: A publisher that transforms elements by applying a closure that receives its previous return value and the next element from the upstream publisher.
//    public func scan<T>(_ initialResult: T, _ nextPartialResult: @escaping (T, Self.Output) -> T) -> Publishers.Scan<Self, T>
//
//    /// Transforms elements from the upstream publisher by providing the current element to an error-throwing closure along with the last value returned by the closure.
//    ///
//    /// If the closure throws an error, the publisher fails with the error.
//    /// - Parameters:
//    ///   - initialResult: The previous result returned by the `nextPartialResult` closure.
//    ///   - nextPartialResult: An error-throwing closure that takes as its arguments the previous value returned by the closure and the next element emitted from the upstream publisher.
//    /// - Returns: A publisher that transforms elements by applying a closure that receives its previous return value and the next element from the upstream publisher.
//    public func tryScan<T>(_ initialResult: T, _ nextPartialResult: @escaping (T, Self.Output) throws -> T) -> Publishers.TryScan<Self, T>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes the number of elements received from the upstream publisher.
//    ///
//    /// - Returns: A publisher that consumes all elements until the upstream publisher finishes, then emits a single
//    /// value with the total number of elements received.
//    public func count() -> Publishers.Count<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Only publishes the last element of a stream that satisfies a predicate closure, after the stream finishes.
//    /// - Parameter predicate: A closure that takes an element as its parameter and returns a Boolean value indicating whether to publish the element.
//    /// - Returns: A publisher that only publishes the last element satisfying the given predicate.
//    public func last(where predicate: @escaping (Self.Output) -> Bool) -> Publishers.LastWhere<Self>
//
//    /// Only publishes the last element of a stream that satisfies a error-throwing predicate closure, after the stream finishes.
//    ///
//    /// If the predicate closure throws, the publisher fails with the thrown error.
//    /// - Parameter predicate: A closure that takes an element as its parameter and returns a Boolean value indicating whether to publish the element.
//    /// - Returns: A publisher that only publishes the last element satisfying the given predicate.
//    public func tryLast(where predicate: @escaping (Self.Output) throws -> Bool) -> Publishers.TryLastWhere<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Ingores all upstream elements, but passes along a completion state (finished or failed).
//    ///
//    /// The output type of this publisher is `Never`.
//    /// - Returns: A publisher that ignores all upstream elements.
//    public func ignoreOutput() -> Publishers.IgnoreOutput<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Failure == Never {
//
//    /// Assigns each element from a Publisher to a property on an object.
//    ///
//    /// - Parameters:
//    ///   - keyPath: The key path of the property to assign.
//    ///   - object: The object on which to assign the value.
//    /// - Returns: A cancellable instance; used when you end assignment of the received value. Deallocation of the result will tear down the subscription stream.
//    public func assign<Root>(to keyPath: ReferenceWritableKeyPath<Root, Self.Output>, on object: Root) -> AnyCancellable
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Failure == Self.Output.Failure, Self.Output : Publisher {
//
//    /// Flattens the stream of events from multiple upstream publishers to appear as if they were coming from a single stream of events.
//    ///
//    /// This operator switches the inner publisher as new ones arrive but keeps the outer one constant for downstream subscribers.
//    /// For example, given the type `Publisher<Publisher<Data, NSError>, Never>`, calling `switchToLatest()` will result in the type `Publisher<Data, NSError>`. The downstream subscriber sees a continuous stream of values even though they may be coming from different upstream publishers.
//    public func switchToLatest() -> Publishers.SwitchToLatest<Self.Output, Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Attempts to recreate a failed subscription with the upstream publisher using a specified number of attempts to establish the connection.
//    ///
//    /// After exceeding the specified number of retries, the publisher passes the failure to the downstream receiver.
//    /// - Parameter retries: The number of times to attempt to recreate the subscription.
//    /// - Returns: A publisher that attempts to recreate its subscription to a failed upstream publisher.
//    public func retry(_ retries: Int) -> Publishers.Retry<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes either the most-recent or first element published by the upstream publisher in the specified time interval.
//    ///
//    /// - Parameters:
//    ///   - interval: The interval at which to find and emit the most recent element, expressed in the time system of the scheduler.
//    ///   - scheduler: The scheduler on which to publish elements.
//    ///   - latest: A Boolean value that indicates whether to publish the most recent element. If `false`, the publisher emits the first element received during the interval.
//    /// - Returns: A publisher that emits either the most-recent or first element received during the specified interval.
//    public func throttle<S>(for interval: S.SchedulerTimeType.Stride, scheduler: S, latest: Bool) -> Publishers.Throttle<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Returns a publisher as a class instance.
//    ///
//    /// The downstream subscriber receieves elements and completion states unchanged from the upstream publisher. Use this operator when you want to use reference semantics, such as storing a publisher instance in a property.
//    ///
//    /// - Returns: A class instance that republishes its upstream publisher.
//    public func share() -> Publishers.Share<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher where Self.Output : Comparable {
//
//    /// Publishes the minimum value received from the upstream publisher, after it finishes.
//    ///
//    /// After this publisher receives a request for more than 0 items, it requests unlimited items from its upstream publisher.
//    /// - Returns: A publisher that publishes the minimum value received from the upstream publisher, after the upstream publisher finishes.
//    public func min() -> Publishers.Comparison<Self>
//
//    /// Publishes the maximum value received from the upstream publisher, after it finishes.
//    ///
//    /// After this publisher receives a request for more than 0 items, it requests unlimited items from its upstream publisher.
//    /// - Returns: A publisher that publishes the maximum value received from the upstream publisher, after the upstream publisher finishes.
//    public func max() -> Publishers.Comparison<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes the minimum value received from the upstream publisher, after it finishes.
//    ///
//    /// After this publisher receives a request for more than 0 items, it requests unlimited items from its upstream publisher.
//    /// - Parameter areInIncreasingOrder: A closure that receives two elements and returns `true` if they are in increasing order.
//    /// - Returns: A publisher that publishes the minimum value received from the upstream publisher, after the upstream publisher finishes.
//    public func min(by areInIncreasingOrder: @escaping (Self.Output, Self.Output) -> Bool) -> Publishers.Comparison<Self>
//
//    /// Publishes the minimum value received from the upstream publisher, using the provided error-throwing closure to order the items.
//    ///
//    /// After this publisher receives a request for more than 0 items, it requests unlimited items from its upstream publisher.
//    /// - Parameter areInIncreasingOrder: A throwing closure that receives two elements and returns `true` if they are in increasing order. If this closure throws, the publisher terminates with a `Failure`.
//    /// - Returns: A publisher that publishes the minimum value received from the upstream publisher, after the upstream publisher finishes.
//    public func tryMin(by areInIncreasingOrder: @escaping (Self.Output, Self.Output) throws -> Bool) -> Publishers.TryComparison<Self>
//
//    /// Publishes the maximum value received from the upstream publisher, using the provided ordering closure.
//    ///
//    /// After this publisher receives a request for more than 0 items, it requests unlimited items from its upstream publisher.
//    /// - Parameter areInIncreasingOrder: A closure that receives two elements and returns `true` if they are in increasing order.
//    /// - Returns: A publisher that publishes the maximum value received from the upstream publisher, after the upstream publisher finishes.
//    public func max(by areInIncreasingOrder: @escaping (Self.Output, Self.Output) -> Bool) -> Publishers.Comparison<Self>
//
//    /// Publishes the maximum value received from the upstream publisher, using the provided error-throwing closure to order the items.
//    ///
//    /// After this publisher receives a request for more than 0 items, it requests unlimited items from its upstream publisher.
//    /// - Parameter areInIncreasingOrder: A throwing closure that receives two elements and returns `true` if they are in increasing order. If this closure throws, the publisher terminates with a `Failure`.
//    /// - Returns: A publisher that publishes the maximum value received from the upstream publisher, after the upstream publisher finishes.
//    public func tryMax(by areInIncreasingOrder: @escaping (Self.Output, Self.Output) throws -> Bool) -> Publishers.TryComparison<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Replaces nil elements in the stream with the proviced element.
//    ///
//    /// - Parameter output: The element to use when replacing `nil`.
//    /// - Returns: A publisher that replaces `nil` elements from the upstream publisher with the provided element.
//    public func replaceNil<T>(with output: T) -> Publishers.Map<Self, T> where Self.Output == T?
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Replaces any errors in the stream with the provided element.
//    ///
//    /// If the upstream publisher fails with an error, this publisher emits the provided element, then finishes normally.
//    /// - Parameter output: An element to emit when the upstream publisher fails.
//    /// - Returns: A publisher that replaces an error from the upstream publisher with the provided output element.
//    public func replaceError(with output: Self.Output) -> Publishers.ReplaceError<Self>
//
//    /// Replaces an empty stream with the provided element.
//    ///
//    /// If the upstream publisher finishes without producing any elements, this publisher emits the provided element, then finishes normally.
//    /// - Parameter output: An element to emit when the upstream publisher finishes without emitting any elements.
//    /// - Returns: A publisher that replaces an empty stream with the provided output element.
//    public func replaceEmpty(with output: Self.Output) -> Publishers.ReplaceEmpty<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Raises a fatal error when its upstream publisher fails, and otherwise republishes all received input.
//    ///
//    /// Use this function for internal sanity checks that are active during testing but do not impact performance of shipping code.
//    ///
//    /// - Parameters:
//    ///   - prefix: A string used at the beginning of the fatal error message.
//    ///   - file: A filename used in the error message. This defaults to `#file`.
//    ///   - line: A line number used in the error message. This defaults to `#line`.
//    /// - Returns: A publisher that raises a fatal error when its upstream publisher fails.
//    public func assertNoFailure(_ prefix: String = "", file: StaticString = #file, line: UInt = #line) -> Publishers.AssertNoFailure<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Ignores elements from the upstream publisher until it receives an element from a second publisher.
//    ///
//    /// This publisher requests a single value from the upstream publisher, and it ignores (drops) all elements from that publisher until the upstream publisher produces a value. After the `other` publisher produces an element, this publisher cancels its subscription to the `other` publisher, and allows events from the `upstream` publisher to pass through.
//    /// After this publisher receives a subscription from the upstream publisher, it passes through backpressure requests from downstream to the upstream publisher. If the upstream publisher acts on those requests before the other publisher produces an item, this publisher drops the elements it receives from the upstream publisher.
//    ///
//    /// - Parameter publisher: A publisher to monitor for its first emitted element.
//    /// - Returns: A publisher that drops elements from the upstream publisher until the `other` publisher produces a value.
//    public func drop<P>(untilOutputFrom publisher: P) -> Publishers.DropUntilOutput<Self, P> where P : Publisher, Self.Failure == P.Failure
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Prefixes a `Publisher`'s output with the specified sequence.
//    /// - Parameter elements: The elements to publish before this publisher’s elements.
//    /// - Returns: A publisher that prefixes the specified elements prior to this publisher’s elements.
//    public func prepend(_ elements: Self.Output...) -> Publishers.Concatenate<Publishers.Sequence<[Self.Output], Self.Failure>, Self>
//
//    /// Prefixes a `Publisher`'s output with the specified sequence.
//    /// - Parameter elements: A sequence of elements to publish before this publisher’s elements.
//    /// - Returns: A publisher that prefixes the sequence of elements prior to this publisher’s elements.
//    public func prepend<S>(_ elements: S) -> Publishers.Concatenate<Publishers.Sequence<S, Self.Failure>, Self> where S : Sequence, Self.Output == S.Element
//
//    /// Prefixes this publisher’s output with the elements emitted by the given publisher.
//    ///
//    /// The resulting publisher doesn’t emit any elements until the prefixing publisher finishes.
//    /// - Parameter publisher: The prefixing publisher.
//    /// - Returns: A publisher that prefixes the prefixing publisher’s elements prior to this publisher’s elements.
//    public func prepend<P>(_ publisher: P) -> Publishers.Concatenate<P, Self> where P : Publisher, Self.Failure == P.Failure, Self.Output == P.Output
//
//    /// Append a `Publisher`'s output with the specified sequence.
//    public func append(_ elements: Self.Output...) -> Publishers.Concatenate<Self, Publishers.Sequence<[Self.Output], Self.Failure>>
//
//    /// Appends a `Publisher`'s output with the specified sequence.
//    public func append<S>(_ elements: S) -> Publishers.Concatenate<Self, Publishers.Sequence<S, Self.Failure>> where S : Sequence, Self.Output == S.Element
//
//    /// Appends this publisher’s output with the elements emitted by the given publisher.
//    ///
//    /// This operator produces no elements until this publisher finishes. It then produces this publisher’s elements, followed by the given publisher’s elements. If this publisher fails with an error, the prefixing publisher does not publish the provided publisher’s elements.
//    /// - Parameter publisher: The appending publisher.
//    /// - Returns: A publisher that appends the appending publisher’s elements after this publisher’s elements.
//    public func append<P>(_ publisher: P) -> Publishers.Concatenate<Self, P> where P : Publisher, Self.Failure == P.Failure, Self.Output == P.Output
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes elements only after a specified time interval elapses between events.
//    ///
//    /// Use this operator when you want to wait for a pause in the delivery of events from the upstream publisher. For example, call `debounce` on the publisher from a text field to only receive elements when the user pauses or stops typing. When they start typing again, the `debounce` holds event delivery until the next pause.
//    /// - Parameters:
//    ///   - dueTime: The time the publisher should wait before publishing an element.
//    ///   - scheduler: The scheduler on which this publisher delivers elements
//    ///   - options: Scheduler options that customize this publisher’s delivery of elements.
//    /// - Returns: A publisher that publishes events only after a specified time elapses.
//    public func debounce<S>(for dueTime: S.SchedulerTimeType.Stride, scheduler: S, options: S.SchedulerOptions? = nil) -> Publishers.Debounce<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Only publishes the last element of a stream, after the stream finishes.
//    /// - Returns: A publisher that only publishes the last element of a stream.
//    public func last() -> Publishers.Last<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Terminates publishing if the upstream publisher exceeds the specified time interval without producing an element.
//    ///
//    /// - Parameters:
//    ///   - interval: The maximum time interval the publisher can go without emitting an element, expressed in the time system of the scheduler.
//    ///   - scheduler: The scheduler to deliver events on.
//    ///   - options: Scheduler options that customize the delivery of elements.
//    ///   - customError: A closure that executes if the publisher times out. The publisher sends the failure returned by this closure to the subscriber as the reason for termination.
//    /// - Returns: A publisher that terminates if the specified interval elapses with no events received from the upstream publisher.
//    public func timeout<S>(_ interval: S.SchedulerTimeType.Stride, scheduler: S, options: S.SchedulerOptions? = nil, customError: (() -> Self.Failure)? = nil) -> Publishers.Timeout<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Buffers elements received from an upstream publisher.
//    /// - Parameter size: The maximum number of elements to store.
//    /// - Parameter prefetch: The strategy for initially populating the buffer.
//    /// - Parameter whenFull: The action to take when the buffer becomes full.
//    public func buffer(size: Int, prefetch: Publishers.PrefetchStrategy, whenFull: Publishers.BufferingStrategy<Self.Failure>) -> Publishers.Buffer<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Combine elements from another publisher and deliver pairs of elements as tuples.
//    ///
//    /// The returned publisher waits until both publishers have emitted an event, then delivers the oldest unconsumed event from each publisher together as a tuple to the subscriber.
//    /// For example, if publisher `P1` emits elements `a` and `b`, and publisher `P2` emits event `c`, the zip publisher emits the tuple `(a, c)`. It won’t emit a tuple with event `b` until `P2` emits another event.
//    /// If either upstream publisher finishes successfuly or fails with an error, the zipped publisher does the same.
//    ///
//    /// - Parameter other: Another publisher.
//    /// - Returns: A publisher that emits pairs of elements from the upstream publishers as tuples.
//    public func zip<P>(_ other: P) -> Publishers.Zip<Self, P> where P : Publisher, Self.Failure == P.Failure
//
//    /// Combine elements from another publisher and deliver a transformed output.
//    ///
//    /// The returned publisher waits until both publishers have emitted an event, then delivers the oldest unconsumed event from each publisher together as a tuple to the subscriber.
//    /// For example, if publisher `P1` emits elements `a` and `b`, and publisher `P2` emits event `c`, the zip publisher emits the tuple `(a, c)`. It won’t emit a tuple with event `b` until `P2` emits another event.
//    /// If either upstream publisher finishes successfuly or fails with an error, the zipped publisher does the same.
//    ///
//    /// - Parameter other: Another publisher.
//    ///   - transform: A closure that receives the most recent value from each publisher and returns a new value to publish.
//    /// - Returns: A publisher that emits pairs of elements from the upstream publishers as tuples.
//    public func zip<P, T>(_ other: P, _ transform: @escaping (Self.Output, P.Output) -> T) -> Publishers.Map<Publishers.Zip<Self, P>, T> where P : Publisher, Self.Failure == P.Failure
//
//    /// Combine elements from two other publishers and deliver groups of elements as tuples.
//    ///
//    /// The returned publisher waits until all three publishers have emitted an event, then delivers the oldest unconsumed event from each publisher as a tuple to the subscriber.
//    /// For example, if publisher `P1` emits elements `a` and `b`, and publisher `P2` emits elements `c` and `d`, and publisher `P3` emits the event `e`, the zip publisher emits the tuple `(a, c, e)`. It won’t emit a tuple with elements `b` or `d` until `P3` emits another event.
//    /// If any upstream publisher finishes successfuly or fails with an error, the zipped publisher does the same.
//    ///
//    /// - Parameters:
//    ///   - publisher1: A second publisher.
//    ///   - publisher2: A third publisher.
//    /// - Returns: A publisher that emits groups of elements from the upstream publishers as tuples.
//    public func zip<P, Q>(_ publisher1: P, _ publisher2: Q) -> Publishers.Zip3<Self, P, Q> where P : Publisher, Q : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure
//
//    /// Combine elements from two other publishers and deliver a transformed output.
//    ///
//    /// The returned publisher waits until all three publishers have emitted an event, then delivers the oldest unconsumed event from each publisher as a tuple to the subscriber.
//    /// For example, if publisher `P1` emits elements `a` and `b`, and publisher `P2` emits elements `c` and `d`, and publisher `P3` emits the event `e`, the zip publisher emits the tuple `(a, c, e)`. It won’t emit a tuple with elements `b` or `d` until `P3` emits another event.
//    /// If any upstream publisher finishes successfuly or fails with an error, the zipped publisher does the same.
//    ///
//    /// - Parameters:
//    ///   - publisher1: A second publisher.
//    ///   - publisher2: A third publisher.
//    ///   - transform: A closure that receives the most recent value from each publisher and returns a new value to publish.
//    /// - Returns: A publisher that emits groups of elements from the upstream publishers as tuples.
//    public func zip<P, Q, T>(_ publisher1: P, _ publisher2: Q, _ transform: @escaping (Self.Output, P.Output, Q.Output) -> T) -> Publishers.Map<Publishers.Zip3<Self, P, Q>, T> where P : Publisher, Q : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure
//
//    /// Combine elements from three other publishers and deliver groups of elements as tuples.
//    ///
//    /// The returned publisher waits until all four publishers have emitted an event, then delivers the oldest unconsumed event from each publisher as a tuple to the subscriber.
//    /// For example, if publisher `P1` emits elements `a` and `b`, and publisher `P2` emits elements `c` and `d`, and publisher `P3` emits the elements `e` and `f`, and publisher `P4` emits the event `g`, the zip publisher emits the tuple `(a, c, e, g)`. It won’t emit a tuple with elements `b`, `d`, or `f` until `P4` emits another event.
//    /// If any upstream publisher finishes successfuly or fails with an error, the zipped publisher does the same.
//    ///
//    /// - Parameters:
//    ///   - publisher1: A second publisher.
//    ///   - publisher2: A third publisher.
//    ///   - publisher3: A fourth publisher.
//    /// - Returns: A publisher that emits groups of elements from the upstream publishers as tuples.
//    public func zip<P, Q, R>(_ publisher1: P, _ publisher2: Q, _ publisher3: R) -> Publishers.Zip4<Self, P, Q, R> where P : Publisher, Q : Publisher, R : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure, Q.Failure == R.Failure
//
//    /// Combine elements from three other publishers and deliver a transformed output.
//    ///
//    /// The returned publisher waits until all four publishers have emitted an event, then delivers the oldest unconsumed event from each publisher as a tuple to the subscriber.
//    /// For example, if publisher `P1` emits elements `a` and `b`, and publisher `P2` emits elements `c` and `d`, and publisher `P3` emits the elements `e` and `f`, and publisher `P4` emits the event `g`, the zip publisher emits the tuple `(a, c, e, g)`. It won’t emit a tuple with elements `b`, `d`, or `f` until `P4` emits another event.
//    /// If any upstream publisher finishes successfuly or fails with an error, the zipped publisher does the same.
//    ///
//    /// - Parameters:
//    ///   - publisher1: A second publisher.
//    ///   - publisher2: A third publisher.
//    ///   - publisher3: A fourth publisher.
//    ///   - transform: A closure that receives the most recent value from each publisher and returns a new value to publish.
//    /// - Returns: A publisher that emits groups of elements from the upstream publishers as tuples.
//    public func zip<P, Q, R, T>(_ publisher1: P, _ publisher2: Q, _ publisher3: R, _ transform: @escaping (Self.Output, P.Output, Q.Output, R.Output) -> T) -> Publishers.Map<Publishers.Zip4<Self, P, Q, R>, T> where P : Publisher, Q : Publisher, R : Publisher, Self.Failure == P.Failure, P.Failure == Q.Failure, Q.Failure == R.Failure
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes a specific element, indicated by its index in the sequence of published elements.
//    ///
//    /// If the publisher completes normally or with an error before publishing the specified element, then the publisher doesn’t produce any elements.
//    /// - Parameter index: The index that indicates the element to publish.
//    /// - Returns: A publisher that publishes a specific indexed element.
//    public func output(at index: Int) -> Publishers.Output<Self>
//
//    /// Publishes elements specified by their range in the sequence of published elements.
//    ///
//    /// After all elements are published, the publisher finishes normally.
//    /// If the publisher completes normally or with an error before producing all the elements in the range, it doesn’t publish the remaining elements.
//    /// - Parameter range: A range that indicates which elements to publish.
//    /// - Returns: A publisher that publishes elements specified by a range.
//    public func output<R>(in range: R) -> Publishers.Output<Self> where R : RangeExpression, R.Bound == Int
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Handles errors from an upstream publisher by replacing it with another publisher.
//    ///
//    /// The following example replaces any error from the upstream publisher and replaces the upstream with a `Just` publisher. This continues the stream by publishing a single value and completing normally.
//    /// ```
//    /// enum SimpleError: Error { case error }
//    /// let errorPublisher = (0..<10).publisher.tryMap { v -> Int in
//    ///     if v < 5 {
//    ///         return v
//    ///     } else {
//    ///         throw SimpleError.error
//    ///     }
//    /// }
//    ///
//    /// let noErrorPublisher = errorPublisher.catch { _ in
//    ///     return Just(100)
//    /// }
//    /// ```
//    /// Backpressure note: This publisher passes through `request` and `cancel` to the upstream. After receiving an error, the publisher sends sends any unfulfilled demand to the new `Publisher`.
//    /// - Parameter handler: A closure that accepts the upstream failure as input and returns a publisher to replace the upstream publisher.
//    /// - Returns: A publisher that handles errors from an upstream publisher by replacing the failed publisher with another publisher.
//    public func `catch`<P>(_ handler: @escaping (Self.Failure) -> P) -> Publishers.Catch<Self, P> where P : Publisher, Self.Output == P.Output
//
//    /// Handles errors from an upstream publisher by either replacing it with another publisher or `throw`ing  a new error.
//    ///
//    /// - Parameter handler: A `throw`ing closure that accepts the upstream failure as input and returns a publisher to replace the upstream publisher or if an error is thrown will send the error downstream.
//    /// - Returns: A publisher that handles errors from an upstream publisher by replacing the failed publisher with another publisher.
//    public func tryCatch<P>(_ handler: @escaping (Self.Failure) throws -> P) -> Publishers.TryCatch<Self, P> where P : Publisher, Self.Output == P.Output
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Transforms all elements from an upstream publisher into a new or existing publisher.
//    ///
//    /// `flatMap` merges the output from all returned publishers into a single stream of output.
//    ///
//    /// - Parameters:
//    ///   - maxPublishers: The maximum number of publishers produced by this method.
//    ///   - transform: A closure that takes an element as a parameter and returns a publisher
//    /// that produces elements of that type.
//    /// - Returns: A publisher that transforms elements from an upstream publisher into
//    /// a publisher of that element’s type.
//    public func flatMap<T, P>(maxPublishers: Subscribers.Demand = .unlimited, _ transform: @escaping (Self.Output) -> P) -> Publishers.FlatMap<P, Self> where T == P.Output, P : Publisher, Self.Failure == P.Failure
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Delays delivery of all output to the downstream receiver by a specified amount of time on a particular scheduler.
//    ///
//    /// The delay affects the delivery of elements and completion, but not of the original subscription.
//    /// - Parameters:
//    ///   - interval: The amount of time to delay.
//    ///   - tolerance: The allowed tolerance in firing delayed events.
//    ///   - scheduler: The scheduler to deliver the delayed events.
//    /// - Returns: A publisher that delays delivery of elements and completion to the downstream receiver.
//    public func delay<S>(for interval: S.SchedulerTimeType.Stride, tolerance: S.SchedulerTimeType.Stride? = nil, scheduler: S, options: S.SchedulerOptions? = nil) -> Publishers.Delay<Self, S> where S : Scheduler
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Omits the specified number of elements before republishing subsequent elements.
//    ///
//    /// - Parameter count: The number of elements to omit.
//    /// - Returns: A publisher that does not republish the first `count` elements.
//    public func dropFirst(_ count: Int = 1) -> Publishers.Drop<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publisher {
//
//    /// Publishes the first element of a stream, then finishes.
//    ///
//    /// If this publisher doesn’t receive any elements, it finishes without publishing.
//    /// - Returns: A publisher that only publishes the first element of a stream.
//    public func first() -> Publishers.First<Self>
//
//    /// Publishes the first element of a stream to satisfy a predicate closure, then finishes.
//    ///
//    /// The publisher ignores all elements after the first. If this publisher doesn’t receive any elements, it finishes without publishing.
//    /// - Parameter predicate: A closure that takes an element as a parameter and returns a Boolean value that indicates whether to publish the element.
//    /// - Returns: A publisher that only publishes the first element of a stream that satifies the predicate.
//    public func first(where predicate: @escaping (Self.Output) -> Bool) -> Publishers.FirstWhere<Self>
//
//    /// Publishes the first element of a stream to satisfy a throwing predicate closure, then finishes.
//    ///
//    /// The publisher ignores all elements after the first. If this publisher doesn’t receive any elements, it finishes without publishing. If the predicate closure throws, the publisher fails with an error.
//    /// - Parameter predicate: A closure that takes an element as a parameter and returns a Boolean value that indicates whether to publish the element.
//    /// - Returns: A publisher that only publishes the first element of a stream that satifies the predicate.
//    public func tryFirst(where predicate: @escaping (Self.Output) throws -> Bool) -> Publishers.TryFirstWhere<Self>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that uses a subject to deliver elements to multiple subscribers.
//    final public class Multicast<Upstream, SubjectType> : ConnectablePublisher where Upstream : Publisher, SubjectType : Subject, Upstream.Failure == SubjectType.Failure, Upstream.Output == SubjectType.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        final public let upstream: Upstream
//
//        /// A closure to create a new Subject each time a subscriber attaches to the multicast publisher.
//        final public let createSubject: () -> SubjectType
//
//        /// Creates a multicast publisher that applies a closure to create a subject that delivers elements to subscribers.
//        /// - Parameter upstream: The publisher from which this publisher receives elements.
//        /// - Parameter createSubject: A closure to create a new Subject each time a subscriber attaches to the multicast publisher.
//        public init(upstream: Upstream, createSubject: @escaping () -> SubjectType)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        final public func receive<S>(subscriber: S) where S : Subscriber, SubjectType.Failure == S.Failure, SubjectType.Output == S.Input
//
//        /// Connects to the publisher and returns a `Cancellable` instance with which to cancel publishing.
//        ///
//        /// - Returns: A `Cancellable` instance that can be used to cancel publishing.
//        final public func connect() -> Cancellable
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that receives elements from an upstream publisher on a specific scheduler.
//    public struct SubscribeOn<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The scheduler the publisher should use to receive elements.
//        public let scheduler: Context
//
//        /// Scheduler options that customize the delivery of elements.
//        public let options: Context.SchedulerOptions?
//
//        public init(upstream: Upstream, scheduler: Context, options: Context.SchedulerOptions?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that measures and emits the time interval between events received from an upstream publisher.
//    public struct MeasureInterval<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Context.SchedulerTimeType.Stride
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The scheduler on which to deliver elements.
//        public let scheduler: Context
//
//        public init(upstream: Upstream, scheduler: Context)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == Context.SchedulerTimeType.Stride
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that omits elements from an upstream publisher until a given closure returns false.
//    public struct DropWhile<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The closure that indicates whether to drop the element.
//        public let predicate: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.DropWhile<Upstream>.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that omits elements from an upstream publisher until a given error-throwing closure returns false.
//    public struct TryDropWhile<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The error-throwing closure that indicates whether to drop the element.
//        public let predicate: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.TryDropWhile<Upstream>.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryDropWhile<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that republishes all elements that match a provided closure.
//    public struct Filter<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A closure that indicates whether to republish an element.
//        public let isIncluded: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, isIncluded: @escaping (Upstream.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that republishes all elements that match a provided error-throwing closure.
//    public struct TryFilter<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A error-throwing closure that indicates whether to republish an element.
//        public let isIncluded: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, isIncluded: @escaping (Upstream.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryFilter<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that raises a debugger signal when a provided closure needs to stop the process in the debugger.
//    ///
//    /// When any of the provided closures returns `true`, this publisher raises the `SIGTRAP` signal to stop the process in the debugger.
//    /// Otherwise, this publisher passes through values and completions as-is.
//    public struct Breakpoint<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A closure that executes when the publisher receives a subscription, and can raise a debugger signal by returning a true Boolean value.
//        public let receiveSubscription: ((Subscription) -> Bool)?
//
//        /// A closure that executes when the publisher receives output from the upstream publisher, and can raise a debugger signal by returning a true Boolean value.
//        public let receiveOutput: ((Upstream.Output) -> Bool)?
//
//        /// A closure that executes when the publisher receives completion, and can raise a debugger signal by returning a true Boolean value.
//        public let receiveCompletion: ((Subscribers.Completion<Upstream.Failure>) -> Bool)?
//
//        /// Creates a breakpoint publisher with the provided upstream publisher and breakpoint-raising closures.
//        ///
//        /// - Parameters:
//        ///   - upstream: The publisher from which this publisher receives elements.
//        ///   - receiveSubscription: A closure that executes when the publisher receives a subscription, and can raise a debugger signal by returning a true Boolean value.
//        ///   - receiveOutput: A closure that executes when the publisher receives output from the upstream publisher, and can raise a debugger signal by returning a true Boolean value.
//        ///   - receiveCompletion: A closure that executes when the publisher receives completion, and can raise a debugger signal by returning a true Boolean value.
//        public init(upstream: Upstream, receiveSubscription: ((Subscription) -> Bool)? = nil, receiveOutput: ((Upstream.Output) -> Bool)? = nil, receiveCompletion: ((Subscribers.Completion<Publishers.Breakpoint<Upstream>.Failure>) -> Bool)? = nil)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes a single Boolean value that indicates whether all received elements pass a given predicate.
//    public struct AllSatisfy<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Bool
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A closure that evaluates each received element.
//        ///
//        ///  Return `true` to continue, or `false` to cancel the upstream and finish.
//        public let predicate: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Upstream.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == Publishers.AllSatisfy<Upstream>.Output
//    }
//
//    /// A publisher that publishes a single Boolean value that indicates whether all received elements pass a given error-throwing predicate.
//    public struct TryAllSatisfy<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Bool
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A closure that evaluates each received element.
//        ///
//        /// Return `true` to continue, or `false` to cancel the upstream and complete. The closure may throw, in which case the publisher cancels the upstream publisher and fails with the thrown error.
//        public let predicate: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Upstream.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Publishers.TryAllSatisfy<Upstream>.Failure, S.Input == Publishers.TryAllSatisfy<Upstream>.Output
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes only elements that don’t match the previous element.
//    public struct RemoveDuplicates<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A closure to evaluate whether two elements are equivalent, for purposes of filtering.
//        public let predicate: (Upstream.Output, Upstream.Output) -> Bool
//
//        /// Creates a publisher that publishes only elements that don’t match the previous element, as evaluated by a provided closure.
//        /// - Parameter upstream: The publisher from which this publisher receives elements.
//        /// - Parameter predicate: A closure to evaluate whether two elements are equivalent, for purposes of filtering. Return `true` from this closure to indicate that the second element is a duplicate of the first.
//        public init(upstream: Upstream, predicate: @escaping (Publishers.RemoveDuplicates<Upstream>.Output, Publishers.RemoveDuplicates<Upstream>.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that publishes only elements that don’t match the previous element, as evaluated by a provided error-throwing closure.
//    public struct TryRemoveDuplicates<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// An error-throwing closure to evaluate whether two elements are equivalent, for purposes of filtering.
//        public let predicate: (Upstream.Output, Upstream.Output) throws -> Bool
//
//        /// Creates a publisher that publishes only elements that don’t match the previous element, as evaluated by a provided error-throwing closure.
//        /// - Parameter upstream: The publisher from which this publisher receives elements.
//        /// - Parameter predicate: An error-throwing closure to evaluate whether two elements are equivalent, for purposes of filtering. Return `true` from this closure to indicate that the second element is a duplicate of the first. If this closure throws an error, the publisher terminates with the thrown error.
//        public init(upstream: Upstream, predicate: @escaping (Publishers.TryRemoveDuplicates<Upstream>.Output, Publishers.TryRemoveDuplicates<Upstream>.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryRemoveDuplicates<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that emits a Boolean value when a specified element is received from its upstream publisher.
//    public struct Contains<Upstream> : Publisher where Upstream : Publisher, Upstream.Output : Equatable {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Bool
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The element to scan for in the upstream publisher.
//        public let output: Upstream.Output
//
//        public init(upstream: Upstream, output: Upstream.Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == Publishers.Contains<Upstream>.Output
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that receives and combines the latest elements from two publishers.
//    public struct CombineLatest<A, B> : Publisher where A : Publisher, B : Publisher, A.Failure == B.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (A.Output, B.Output)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public init(_ a: A, _ b: B)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, B.Failure == S.Failure, S.Input == (A.Output, B.Output)
//    }
//
//    /// A publisher that receives and combines the latest elements from three publishers.
//    public struct CombineLatest3<A, B, C> : Publisher where A : Publisher, B : Publisher, C : Publisher, A.Failure == B.Failure, B.Failure == C.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (A.Output, B.Output, C.Output)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public init(_ a: A, _ b: B, _ c: C)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, C.Failure == S.Failure, S.Input == (A.Output, B.Output, C.Output)
//    }
//
//    /// A publisher that receives and combines the latest elements from four publishers.
//    public struct CombineLatest4<A, B, C, D> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, A.Failure == B.Failure, B.Failure == C.Failure, C.Failure == D.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (A.Output, B.Output, C.Output, D.Output)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, D.Failure == S.Failure, S.Input == (A.Output, B.Output, C.Output, D.Output)
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that automatically connects and disconnects from this connectable publisher.
//    public class Autoconnect<Upstream> : Publisher where Upstream : ConnectablePublisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        final public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that prints log messages for all publishing events, optionally prefixed with a given string.
//    ///
//    /// This publisher prints log messages when receiving the following events:
//    /// * subscription
//    /// * value
//    /// * normal completion
//    /// * failure
//    /// * cancellation
//    public struct Print<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// A string with which to prefix all log messages.
//        public let prefix: String
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public let stream: TextOutputStream?
//
//        /// Creates a publisher that prints log messages for all publishing events.
//        ///
//        /// - Parameters:
//        ///   - upstream: The publisher from which this publisher receives elements.
//        ///   - prefix: A string with which to prefix all log messages.
//        public init(upstream: Upstream, prefix: String, to stream: TextOutputStream? = nil)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that republishes elements while a predicate closure indicates publishing should continue.
//    public struct PrefixWhile<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The closure that determines whether whether publishing should continue.
//        public let predicate: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.PrefixWhile<Upstream>.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that republishes elements while an error-throwing predicate closure indicates publishing should continue.
//    public struct TryPrefixWhile<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The error-throwing closure that determines whether publishing should continue.
//        public let predicate: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.TryPrefixWhile<Upstream>.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryPrefixWhile<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that appears to send a specified failure type.
//    ///
//    /// The publisher cannot actually fail with the specified type and instead just finishes normally. Use this publisher type when you need to match the error types for two mismatched publishers.
//    public struct SetFailureType<Upstream, Failure> : Publisher where Upstream : Publisher, Failure : Error, Upstream.Failure == Never {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// Creates a publisher that appears to send a specified failure type.
//        ///
//        /// - Parameter upstream: The publisher from which this publisher receives elements.
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Failure == S.Failure, S : Subscriber, Upstream.Output == S.Input
//
//        public func setFailureType<E>(to failure: E.Type) -> Publishers.SetFailureType<Upstream, E> where E : Error
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that emits a Boolean value upon receiving an element that satisfies the predicate closure.
//    public struct ContainsWhere<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Bool
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The closure that determines whether the publisher should consider an element as a match.
//        public let predicate: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Upstream.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == Publishers.ContainsWhere<Upstream>.Output
//    }
//
//    /// A publisher that emits a Boolean value upon receiving an element that satisfies the throwing predicate closure.
//    public struct TryContainsWhere<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Bool
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The error-throwing closure that determines whether this publisher should emit a `true` element.
//        public let predicate: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Upstream.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, S.Failure == Publishers.TryContainsWhere<Upstream>.Failure, S.Input == Publishers.TryContainsWhere<Upstream>.Output
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    public struct MakeConnectable<Upstream> : ConnectablePublisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//
//        /// Connects to the publisher and returns a `Cancellable` instance with which to cancel publishing.
//        ///
//        /// - Returns: A `Cancellable` instance that can be used to cancel publishing.
//        public func connect() -> Cancellable
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A strategy for collecting received elements.
//    ///
//    /// - byTime: Collect and periodically publish items.
//    /// - byTimeOrCount: Collect and publish items, either periodically or when a buffer reaches its maximum size.
//    public enum TimeGroupingStrategy<Context> where Context : Scheduler {
//
//        case byTime(Context, Context.SchedulerTimeType.Stride)
//
//        case byTimeOrCount(Context, Context.SchedulerTimeType.Stride, Int)
//    }
//
//    /// A publisher that buffers and periodically publishes its items.
//    public struct CollectByTime<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = [Upstream.Output]
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// The strategy with which to collect and publish elements.
//        public let strategy: Publishers.TimeGroupingStrategy<Context>
//
//        /// `Scheduler` options to use for the strategy.
//        public let options: Context.SchedulerOptions?
//
//        public init(upstream: Upstream, strategy: Publishers.TimeGroupingStrategy<Context>, options: Context.SchedulerOptions?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == [Upstream.Output]
//    }
//
//    /// A publisher that buffers items.
//    public struct Collect<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = [Upstream.Output]
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == [Upstream.Output]
//    }
//
//    /// A publisher that buffers a maximum number of items.
//    public struct CollectByCount<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = [Upstream.Output]
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        ///  The maximum number of received elements to buffer before publishing.
//        public let count: Int
//
//        public init(upstream: Upstream, count: Int)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == [Upstream.Output]
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes the value of a key path.
//    public struct MapKeyPath<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The key path of a property to publish.
//        public let keyPath: KeyPath<Upstream.Output, Output>
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, Upstream.Failure == S.Failure
//    }
//
//    /// A publisher that publishes the values of two key paths as a tuple.
//    public struct MapKeyPath2<Upstream, Output0, Output1> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (Output0, Output1)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The key path of a property to publish.
//        public let keyPath0: KeyPath<Upstream.Output, Output0>
//
//        /// The key path of a second property to publish.
//        public let keyPath1: KeyPath<Upstream.Output, Output1>
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == (Output0, Output1)
//    }
//
//    /// A publisher that publishes the values of three key paths as a tuple.
//    public struct MapKeyPath3<Upstream, Output0, Output1, Output2> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (Output0, Output1, Output2)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The key path of a property to publish.
//        public let keyPath0: KeyPath<Upstream.Output, Output0>
//
//        /// The key path of a second property to publish.
//        public let keyPath1: KeyPath<Upstream.Output, Output1>
//
//        /// The key path of a third property to publish.
//        public let keyPath2: KeyPath<Upstream.Output, Output2>
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == (Output0, Output1, Output2)
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    public struct PrefixUntilOutput<Upstream, Other> : Publisher where Upstream : Publisher, Other : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// Another publisher, whose first output causes this publisher to finish.
//        public let other: Other
//
//        public init(upstream: Upstream, other: Other)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that applies a closure to all received elements and produces an accumulated value when the upstream publisher finishes.
//    public struct Reduce<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The initial value provided on the first invocation of the closure.
//        public let initial: Output
//
//        /// A closure that takes the previously-accumulated value and the next element from the upstream publisher to produce a new value.
//        public let nextPartialResult: (Output, Upstream.Output) -> Output
//
//        public init(upstream: Upstream, initial: Output, nextPartialResult: @escaping (Output, Upstream.Output) -> Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, Upstream.Failure == S.Failure
//    }
//
//    /// A publisher that applies an error-throwing closure to all received elements and produces an accumulated value when the upstream publisher finishes.
//    public struct TryReduce<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The initial value provided on the first invocation of the closure.
//        public let initial: Output
//
//        /// An error-throwing closure that takes the previously-accumulated value and the next element from the upstream to produce a new value.
//        ///
//        /// If this closure throws an error, the publisher fails and passes the error to its subscriber.
//        public let nextPartialResult: (Output, Upstream.Output) throws -> Output
//
//        public init(upstream: Upstream, initial: Output, nextPartialResult: @escaping (Output, Upstream.Output) throws -> Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, S.Failure == Publishers.TryReduce<Upstream, Output>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that republishes all non-`nil` results of calling a closure with each received element.
//    public struct CompactMap<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// A closure that receives values from the upstream publisher and returns optional values.
//        public let transform: (Upstream.Output) -> Output?
//
//        public init(upstream: Upstream, transform: @escaping (Upstream.Output) -> Output?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, Upstream.Failure == S.Failure
//    }
//
//    /// A publisher that republishes all non-`nil` results of calling an error-throwing closure with each received element.
//    public struct TryCompactMap<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// An error-throwing closure that receives values from the upstream publisher and returns optional values.
//        ///
//        /// If this closure throws an error, the publisher fails.
//        public let transform: (Upstream.Output) throws -> Output?
//
//        public init(upstream: Upstream, transform: @escaping (Upstream.Output) throws -> Output?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, S.Failure == Publishers.TryCompactMap<Upstream, Output>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher created by applying the merge function to two upstream publishers.
//    public struct Merge<A, B> : Publisher where A : Publisher, B : Publisher, A.Failure == B.Failure, A.Output == B.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public init(_ a: A, _ b: B)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, B.Failure == S.Failure, B.Output == S.Input
//
//        public func merge<P>(with other: P) -> Publishers.Merge3<A, B, P> where P : Publisher, B.Failure == P.Failure, B.Output == P.Output
//
//        public func merge<Z, Y>(with z: Z, _ y: Y) -> Publishers.Merge4<A, B, Z, Y> where Z : Publisher, Y : Publisher, B.Failure == Z.Failure, B.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output
//
//        public func merge<Z, Y, X>(with z: Z, _ y: Y, _ x: X) -> Publishers.Merge5<A, B, Z, Y, X> where Z : Publisher, Y : Publisher, X : Publisher, B.Failure == Z.Failure, B.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output
//
//        public func merge<Z, Y, X, W>(with z: Z, _ y: Y, _ x: X, _ w: W) -> Publishers.Merge6<A, B, Z, Y, X, W> where Z : Publisher, Y : Publisher, X : Publisher, W : Publisher, B.Failure == Z.Failure, B.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output, X.Failure == W.Failure, X.Output == W.Output
//
//        public func merge<Z, Y, X, W, V>(with z: Z, _ y: Y, _ x: X, _ w: W, _ v: V) -> Publishers.Merge7<A, B, Z, Y, X, W, V> where Z : Publisher, Y : Publisher, X : Publisher, W : Publisher, V : Publisher, B.Failure == Z.Failure, B.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output, X.Failure == W.Failure, X.Output == W.Output, W.Failure == V.Failure, W.Output == V.Output
//
//        public func merge<Z, Y, X, W, V, U>(with z: Z, _ y: Y, _ x: X, _ w: W, _ v: V, _ u: U) -> Publishers.Merge8<A, B, Z, Y, X, W, V, U> where Z : Publisher, Y : Publisher, X : Publisher, W : Publisher, V : Publisher, U : Publisher, B.Failure == Z.Failure, B.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output, X.Failure == W.Failure, X.Output == W.Output, W.Failure == V.Failure, W.Output == V.Output, V.Failure == U.Failure, V.Output == U.Output
//    }
//
//    /// A publisher created by applying the merge function to three upstream publishers.
//    public struct Merge3<A, B, C> : Publisher where A : Publisher, B : Publisher, C : Publisher, A.Failure == B.Failure, A.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public init(_ a: A, _ b: B, _ c: C)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, C.Failure == S.Failure, C.Output == S.Input
//
//        public func merge<P>(with other: P) -> Publishers.Merge4<A, B, C, P> where P : Publisher, C.Failure == P.Failure, C.Output == P.Output
//
//        public func merge<Z, Y>(with z: Z, _ y: Y) -> Publishers.Merge5<A, B, C, Z, Y> where Z : Publisher, Y : Publisher, C.Failure == Z.Failure, C.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output
//
//        public func merge<Z, Y, X>(with z: Z, _ y: Y, _ x: X) -> Publishers.Merge6<A, B, C, Z, Y, X> where Z : Publisher, Y : Publisher, X : Publisher, C.Failure == Z.Failure, C.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output
//
//        public func merge<Z, Y, X, W>(with z: Z, _ y: Y, _ x: X, _ w: W) -> Publishers.Merge7<A, B, C, Z, Y, X, W> where Z : Publisher, Y : Publisher, X : Publisher, W : Publisher, C.Failure == Z.Failure, C.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output, X.Failure == W.Failure, X.Output == W.Output
//
//        public func merge<Z, Y, X, W, V>(with z: Z, _ y: Y, _ x: X, _ w: W, _ v: V) -> Publishers.Merge8<A, B, C, Z, Y, X, W, V> where Z : Publisher, Y : Publisher, X : Publisher, W : Publisher, V : Publisher, C.Failure == Z.Failure, C.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output, X.Failure == W.Failure, X.Output == W.Output, W.Failure == V.Failure, W.Output == V.Output
//    }
//
//    /// A publisher created by applying the merge function to four upstream publishers.
//    public struct Merge4<A, B, C, D> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, A.Failure == B.Failure, A.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, D.Failure == S.Failure, D.Output == S.Input
//
//        public func merge<P>(with other: P) -> Publishers.Merge5<A, B, C, D, P> where P : Publisher, D.Failure == P.Failure, D.Output == P.Output
//
//        public func merge<Z, Y>(with z: Z, _ y: Y) -> Publishers.Merge6<A, B, C, D, Z, Y> where Z : Publisher, Y : Publisher, D.Failure == Z.Failure, D.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output
//
//        public func merge<Z, Y, X>(with z: Z, _ y: Y, _ x: X) -> Publishers.Merge7<A, B, C, D, Z, Y, X> where Z : Publisher, Y : Publisher, X : Publisher, D.Failure == Z.Failure, D.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output
//
//        public func merge<Z, Y, X, W>(with z: Z, _ y: Y, _ x: X, _ w: W) -> Publishers.Merge8<A, B, C, D, Z, Y, X, W> where Z : Publisher, Y : Publisher, X : Publisher, W : Publisher, D.Failure == Z.Failure, D.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output, X.Failure == W.Failure, X.Output == W.Output
//    }
//
//    /// A publisher created by applying the merge function to five upstream publishers.
//    public struct Merge5<A, B, C, D, E> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, E : Publisher, A.Failure == B.Failure, A.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public let e: E
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, E.Failure == S.Failure, E.Output == S.Input
//
//        public func merge<P>(with other: P) -> Publishers.Merge6<A, B, C, D, E, P> where P : Publisher, E.Failure == P.Failure, E.Output == P.Output
//
//        public func merge<Z, Y>(with z: Z, _ y: Y) -> Publishers.Merge7<A, B, C, D, E, Z, Y> where Z : Publisher, Y : Publisher, E.Failure == Z.Failure, E.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output
//
//        public func merge<Z, Y, X>(with z: Z, _ y: Y, _ x: X) -> Publishers.Merge8<A, B, C, D, E, Z, Y, X> where Z : Publisher, Y : Publisher, X : Publisher, E.Failure == Z.Failure, E.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output, Y.Failure == X.Failure, Y.Output == X.Output
//    }
//
//    /// A publisher created by applying the merge function to six upstream publishers.
//    public struct Merge6<A, B, C, D, E, F> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, E : Publisher, F : Publisher, A.Failure == B.Failure, A.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output, E.Failure == F.Failure, E.Output == F.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public let e: E
//
//        public let f: F
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, F.Failure == S.Failure, F.Output == S.Input
//
//        public func merge<P>(with other: P) -> Publishers.Merge7<A, B, C, D, E, F, P> where P : Publisher, F.Failure == P.Failure, F.Output == P.Output
//
//        public func merge<Z, Y>(with z: Z, _ y: Y) -> Publishers.Merge8<A, B, C, D, E, F, Z, Y> where Z : Publisher, Y : Publisher, F.Failure == Z.Failure, F.Output == Z.Output, Z.Failure == Y.Failure, Z.Output == Y.Output
//    }
//
//    /// A publisher created by applying the merge function to seven upstream publishers.
//    public struct Merge7<A, B, C, D, E, F, G> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, E : Publisher, F : Publisher, G : Publisher, A.Failure == B.Failure, A.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output, E.Failure == F.Failure, E.Output == F.Output, F.Failure == G.Failure, F.Output == G.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public let e: E
//
//        public let f: F
//
//        public let g: G
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, G.Failure == S.Failure, G.Output == S.Input
//
//        public func merge<P>(with other: P) -> Publishers.Merge8<A, B, C, D, E, F, G, P> where P : Publisher, G.Failure == P.Failure, G.Output == P.Output
//    }
//
//    /// A publisher created by applying the merge function to eight upstream publishers.
//    public struct Merge8<A, B, C, D, E, F, G, H> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, E : Publisher, F : Publisher, G : Publisher, H : Publisher, A.Failure == B.Failure, A.Output == B.Output, B.Failure == C.Failure, B.Output == C.Output, C.Failure == D.Failure, C.Output == D.Output, D.Failure == E.Failure, D.Output == E.Output, E.Failure == F.Failure, E.Output == F.Output, F.Failure == G.Failure, F.Output == G.Output, G.Failure == H.Failure, G.Output == H.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = A.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public let e: E
//
//        public let f: F
//
//        public let g: G
//
//        public let h: H
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D, _ e: E, _ f: F, _ g: G, _ h: H)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, H.Failure == S.Failure, H.Output == S.Input
//    }
//
//    public struct MergeMany<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        public let publishers: [Upstream]
//
//        public init(_ upstream: Upstream...)
//
//        public init<S>(_ upstream: S) where Upstream == S.Element, S : Sequence
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//
//        public func merge(with other: Upstream) -> Publishers.MergeMany<Upstream>
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    public struct Scan<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        public let upstream: Upstream
//
//        public let initialResult: Output
//
//        public let nextPartialResult: (Output, Upstream.Output) -> Output
//
//        public init(upstream: Upstream, initialResult: Output, nextPartialResult: @escaping (Output, Upstream.Output) -> Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, Upstream.Failure == S.Failure
//    }
//
//    public struct TryScan<Upstream, Output> : Publisher where Upstream : Publisher {
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        public let upstream: Upstream
//
//        public let initialResult: Output
//
//        public let nextPartialResult: (Output, Upstream.Output) throws -> Output
//
//        public init(upstream: Upstream, initialResult: Output, nextPartialResult: @escaping (Output, Upstream.Output) throws -> Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Output == S.Input, S : Subscriber, S.Failure == Publishers.TryScan<Upstream, Output>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes the number of elements received from the upstream publisher.
//    public struct Count<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Int
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == Publishers.Count<Upstream>.Output
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that only publishes the last element of a stream that satisfies a predicate closure, once the stream finishes.
//    public struct LastWhere<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The closure that determines whether to publish an element.
//        public let predicate: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.LastWhere<Upstream>.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that only publishes the last element of a stream that satisfies a error-throwing predicate closure, once the stream finishes.
//    public struct TryLastWhere<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The error-throwing closure that determines whether to publish an element.
//        public let predicate: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.TryLastWhere<Upstream>.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryLastWhere<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that ignores all upstream elements, but passes along a completion state (finish or failed).
//    public struct IgnoreOutput<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Never
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, S.Input == Publishers.IgnoreOutput<Upstream>.Output
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that “flattens” nested publishers.
//    ///
//    /// Given a publisher that publishes Publishers, the `SwitchToLatest` publisher produces a sequence of events from only the most recent one.
//    /// For example, given the type `Publisher<Publisher<Data, NSError>, Never>`, calling `switchToLatest()` will result in the type `Publisher<Data, NSError>`. The downstream subscriber sees a continuous stream of values even though they may be coming from different upstream publishers.
//    public struct SwitchToLatest<P, Upstream> : Publisher where P : Publisher, P == Upstream.Output, Upstream : Publisher, P.Failure == Upstream.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = P.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = P.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// Creates a publisher that “flattens” nested publishers.
//        ///
//        /// - Parameter upstream: The publisher from which this publisher receives elements.
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, P.Output == S.Input, Upstream.Failure == S.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that attempts to recreate its subscription to a failed upstream publisher.
//    public struct Retry<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The maximum number of retry attempts to perform.
//        ///
//        /// If `nil`, this publisher attempts to reconnect with the upstream publisher an unlimited number of times.
//        public let retries: Int?
//
//        /// Creates a publisher that attempts to recreate its subscription to a failed upstream publisher.
//        ///
//        /// - Parameters:
//        ///   - upstream: The publisher from which this publisher receives its elements.
//        ///   - retries: The maximum number of retry attempts to perform. If `nil`, this publisher attempts to reconnect with the upstream publisher an unlimited number of times.
//        public init(upstream: Upstream, retries: Int?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes either the most-recent or first element published by the upstream publisher in a specified time interval.
//    public struct Throttle<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The interval in which to find and emit the most recent element.
//        public let interval: Context.SchedulerTimeType.Stride
//
//        /// The scheduler on which to publish elements.
//        public let scheduler: Context
//
//        /// A Boolean value indicating whether to publish the most recent element.
//        ///
//        /// If `false`, the publisher emits the first element received during the interval.
//        public let latest: Bool
//
//        public init(upstream: Upstream, interval: Context.SchedulerTimeType.Stride, scheduler: Context, latest: Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher implemented as a class, which otherwise behaves like its upstream publisher.
//    final public class Share<Upstream> : Publisher, Equatable where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        final public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        final public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//
//        /// Returns a Boolean value indicating whether two values are equal.
//        ///
//        /// Equality is the inverse of inequality. For any values `a` and `b`,
//        /// `a == b` implies that `a != b` is `false`.
//        ///
//        /// - Parameters:
//        ///   - lhs: A value to compare.
//        ///   - rhs: Another value to compare.
//        public static func == (lhs: Publishers.Share<Upstream>, rhs: Publishers.Share<Upstream>) -> Bool
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that republishes items from another publisher only if each new item is in increasing order from the previously-published item.
//    public struct Comparison<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// A closure that receives two elements and returns `true` if they are in increasing order.
//        public let areInIncreasingOrder: (Upstream.Output, Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, areInIncreasingOrder: @escaping (Upstream.Output, Upstream.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that republishes items from another publisher only if each new item is in increasing order from the previously-published item, and fails if the ordering logic throws an error.
//    public struct TryComparison<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// A closure that receives two elements and returns `true` if they are in increasing order.
//        public let areInIncreasingOrder: (Upstream.Output, Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, areInIncreasingOrder: @escaping (Upstream.Output, Upstream.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryComparison<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that replaces an empty stream with a provided element.
//    public struct ReplaceEmpty<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The element to deliver when the upstream publisher finishes without delivering any elements.
//        public let output: Upstream.Output
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream, output: Publishers.ReplaceEmpty<Upstream>.Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that replaces any errors in the stream with a provided element.
//    public struct ReplaceError<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Never
//
//        /// The element with which to replace errors from the upstream publisher.
//        public let output: Upstream.Output
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream, output: Publishers.ReplaceError<Upstream>.Output)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.ReplaceError<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that raises a fatal error upon receiving any failure, and otherwise republishes all received input.
//    ///
//    /// Use this function for internal sanity checks that are active during testing but do not impact performance of shipping code.
//    public struct AssertNoFailure<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Never
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The string used at the beginning of the fatal error message.
//        public let prefix: String
//
//        /// The filename used in the error message.
//        public let file: StaticString
//
//        /// The line number used in the error message.
//        public let line: UInt
//
//        public init(upstream: Upstream, prefix: String, file: StaticString, line: UInt)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.AssertNoFailure<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that ignores elements from the upstream publisher until it receives an element from second publisher.
//    public struct DropUntilOutput<Upstream, Other> : Publisher where Upstream : Publisher, Other : Publisher, Upstream.Failure == Other.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// A publisher to monitor for its first emitted element.
//        public let other: Other
//
//        /// Creates a publisher that ignores elements from the upstream publisher until it receives an element from another publisher.
//        ///
//        /// - Parameters:
//        ///   - upstream: A publisher to drop elements from while waiting for another publisher to emit elements.
//        ///   - other: A publisher to monitor for its first emitted element.
//        public init(upstream: Upstream, other: Other)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, Other.Failure == S.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that emits all of one publisher’s elements before those from another publisher.
//    public struct Concatenate<Prefix, Suffix> : Publisher where Prefix : Publisher, Suffix : Publisher, Prefix.Failure == Suffix.Failure, Prefix.Output == Suffix.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Suffix.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Suffix.Failure
//
//        /// The publisher to republish, in its entirety, before republishing elements from `suffix`.
//        public let prefix: Prefix
//
//        /// The publisher to republish only after `prefix` finishes.
//        public let suffix: Suffix
//
//        public init(prefix: Prefix, suffix: Suffix)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Suffix.Failure == S.Failure, Suffix.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes elements only after a specified time interval elapses between events.
//    public struct Debounce<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The amount of time the publisher should wait before publishing an element.
//        public let dueTime: Context.SchedulerTimeType.Stride
//
//        /// The scheduler on which this publisher delivers elements.
//        public let scheduler: Context
//
//        /// Scheduler options that customize this publisher’s delivery of elements.
//        public let options: Context.SchedulerOptions?
//
//        public init(upstream: Upstream, dueTime: Context.SchedulerTimeType.Stride, scheduler: Context, options: Context.SchedulerOptions?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that only publishes the last element of a stream, after the stream finishes.
//    public struct Last<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    public struct Timeout<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        public let upstream: Upstream
//
//        public let interval: Context.SchedulerTimeType.Stride
//
//        public let scheduler: Context
//
//        public let options: Context.SchedulerOptions?
//
//        public let customError: (() -> Upstream.Failure)?
//
//        public init(upstream: Upstream, interval: Context.SchedulerTimeType.Stride, scheduler: Context, options: Context.SchedulerOptions?, customError: (() -> Publishers.Timeout<Upstream, Context>.Failure)?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A strategy for filling a buffer.
//    ///
//    /// * keepFull: A strategy to fill the buffer at subscription time, and keep it full thereafter.
//    /// * byRequest: A strategy that avoids prefetching and instead performs requests on demand.
//    public enum PrefetchStrategy {
//
//        case keepFull
//
//        case byRequest
//
//        /// Returns a Boolean value indicating whether two values are equal.
//        ///
//        /// Equality is the inverse of inequality. For any values `a` and `b`,
//        /// `a == b` implies that `a != b` is `false`.
//        ///
//        /// - Parameters:
//        ///   - lhs: A value to compare.
//        ///   - rhs: Another value to compare.
//        public static func == (a: Publishers.PrefetchStrategy, b: Publishers.PrefetchStrategy) -> Bool
//
//        /// The hash value.
//        ///
//        /// Hash values are not guaranteed to be equal across different executions of
//        /// your program. Do not save hash values to use during a future execution.
//        ///
//        /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
//        ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
//        public var hashValue: Int { get }
//
//        /// Hashes the essential components of this value by feeding them into the
//        /// given hasher.
//        ///
//        /// Implement this method to conform to the `Hashable` protocol. The
//        /// components used for hashing must be the same as the components compared
//        /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//        /// with each of these components.
//        ///
//        /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//        ///   compile-time error in the future.
//        ///
//        /// - Parameter hasher: The hasher to use when combining the components
//        ///   of this instance.
//        public func hash(into hasher: inout Hasher)
//    }
//
//    /// A strategy for handling exhaustion of a buffer’s capacity.
//    ///
//    /// * dropNewest: When full, discard the newly-received element without buffering it.
//    /// * dropOldest: When full, remove the least recently-received element from the buffer.
//    /// * customError: When full, execute the closure to provide a custom error.
//    public enum BufferingStrategy<Failure> where Failure : Error {
//
//        case dropNewest
//
//        case dropOldest
//
//        case customError(() -> Failure)
//    }
//
//    /// A publisher that buffers elements received from an upstream publisher.
//    public struct Buffer<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The maximum number of elements to store.
//        public let size: Int
//
//        /// The strategy for initially populating the buffer.
//        public let prefetch: Publishers.PrefetchStrategy
//
//        /// The action to take when the buffer becomes full.
//        public let whenFull: Publishers.BufferingStrategy<Upstream.Failure>
//
//        /// Creates a publisher that buffers elements received from an upstream publisher.
//        /// - Parameter upstream: The publisher from which this publisher receives elements.
//        /// - Parameter size: The maximum number of elements to store.
//        /// - Parameter prefetch: The strategy for initially populating the buffer.
//        /// - Parameter whenFull: The action to take when the buffer becomes full.
//        public init(upstream: Upstream, size: Int, prefetch: Publishers.PrefetchStrategy, whenFull: Publishers.BufferingStrategy<Publishers.Buffer<Upstream>.Failure>)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher created by applying the zip function to two upstream publishers.
//    public struct Zip<A, B> : Publisher where A : Publisher, B : Publisher, A.Failure == B.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (A.Output, B.Output)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public init(_ a: A, _ b: B)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, B.Failure == S.Failure, S.Input == (A.Output, B.Output)
//    }
//
//    /// A publisher created by applying the zip function to three upstream publishers.
//    public struct Zip3<A, B, C> : Publisher where A : Publisher, B : Publisher, C : Publisher, A.Failure == B.Failure, B.Failure == C.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (A.Output, B.Output, C.Output)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public init(_ a: A, _ b: B, _ c: C)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, C.Failure == S.Failure, S.Input == (A.Output, B.Output, C.Output)
//    }
//
//    /// A publisher created by applying the zip function to four upstream publishers.
//    public struct Zip4<A, B, C, D> : Publisher where A : Publisher, B : Publisher, C : Publisher, D : Publisher, A.Failure == B.Failure, B.Failure == C.Failure, C.Failure == D.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = (A.Output, B.Output, C.Output, D.Output)
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = A.Failure
//
//        public let a: A
//
//        public let b: B
//
//        public let c: C
//
//        public let d: D
//
//        public init(_ a: A, _ b: B, _ c: C, _ d: D)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, D.Failure == S.Failure, S.Input == (A.Output, B.Output, C.Output, D.Output)
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes elements specified by a range in the sequence of published elements.
//    public struct Output<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// The range of elements to publish.
//        public let range: CountableRange<Int>
//
//        /// Creates a publisher that publishes elements specified by a range.
//        ///
//        /// - Parameters:
//        ///   - upstream: The publisher that this publisher receives elements from.
//        ///   - range: The range of elements to publish.
//        public init(upstream: Upstream, range: CountableRange<Int>)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that handles errors from an upstream publisher by replacing the failed publisher with another publisher.
//    public struct Catch<Upstream, NewPublisher> : Publisher where Upstream : Publisher, NewPublisher : Publisher, Upstream.Output == NewPublisher.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = NewPublisher.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// A closure that accepts the upstream failure as input and returns a publisher to replace the upstream publisher.
//        public let handler: (Upstream.Failure) -> NewPublisher
//
//        /// Creates a publisher that handles errors from an upstream publisher by replacing the failed publisher with another publisher.
//        ///
//        /// - Parameters:
//        ///   - upstream: The publisher that this publisher receives elements from.
//        ///   - handler: A closure that accepts the upstream failure as input and returns a publisher to replace the upstream publisher.
//        public init(upstream: Upstream, handler: @escaping (Upstream.Failure) -> NewPublisher)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, NewPublisher.Failure == S.Failure, NewPublisher.Output == S.Input
//    }
//
//    /// A publisher that handles errors from an upstream publisher by replacing the failed publisher with another publisher or optionally producing a new error.
//    public struct TryCatch<Upstream, NewPublisher> : Publisher where Upstream : Publisher, NewPublisher : Publisher, Upstream.Output == NewPublisher.Output {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        public let upstream: Upstream
//
//        public let handler: (Upstream.Failure) throws -> NewPublisher
//
//        public init(upstream: Upstream, handler: @escaping (Upstream.Failure) throws -> NewPublisher)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, NewPublisher.Output == S.Input, S.Failure == Publishers.TryCatch<Upstream, NewPublisher>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    public struct FlatMap<NewPublisher, Upstream> : Publisher where NewPublisher : Publisher, Upstream : Publisher, NewPublisher.Failure == Upstream.Failure {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = NewPublisher.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        public let upstream: Upstream
//
//        public let maxPublishers: Subscribers.Demand
//
//        public let transform: (Upstream.Output) -> NewPublisher
//
//        public init(upstream: Upstream, maxPublishers: Subscribers.Demand, transform: @escaping (Upstream.Output) -> NewPublisher)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, NewPublisher.Output == S.Input, Upstream.Failure == S.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that delays delivery of elements and completion to the downstream receiver.
//    public struct Delay<Upstream, Context> : Publisher where Upstream : Publisher, Context : Scheduler {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher that this publisher receives elements from.
//        public let upstream: Upstream
//
//        /// The amount of time to delay.
//        public let interval: Context.SchedulerTimeType.Stride
//
//        /// The allowed tolerance in firing delayed events.
//        public let tolerance: Context.SchedulerTimeType.Stride
//
//        /// The scheduler to deliver the delayed events.
//        public let scheduler: Context
//
//        public let options: Context.SchedulerOptions?
//
//        public init(upstream: Upstream, interval: Context.SchedulerTimeType.Stride, tolerance: Context.SchedulerTimeType.Stride, scheduler: Context, options: Context.SchedulerOptions? = nil)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that omits a specified number of elements before republishing later elements.
//    public struct Drop<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The number of elements to drop.
//        public let count: Int
//
//        public init(upstream: Upstream, count: Int)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers {
//
//    /// A publisher that publishes the first element of a stream, then finishes.
//    public struct First<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        public init(upstream: Upstream)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that only publishes the first element of a stream to satisfy a predicate closure.
//    public struct FirstWhere<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Upstream.Failure
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The closure that determines whether to publish an element.
//        public let predicate: (Upstream.Output) -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.FirstWhere<Upstream>.Output) -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Failure == S.Failure, Upstream.Output == S.Input
//    }
//
//    /// A publisher that only publishes the first element of a stream to satisfy a throwing predicate closure.
//    public struct TryFirstWhere<Upstream> : Publisher where Upstream : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Upstream.Output
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Error
//
//        /// The publisher from which this publisher receives elements.
//        public let upstream: Upstream
//
//        /// The error-throwing closure that determines whether to publish an element.
//        public let predicate: (Upstream.Output) throws -> Bool
//
//        public init(upstream: Upstream, predicate: @escaping (Publishers.TryFirstWhere<Upstream>.Output) throws -> Bool)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where S : Subscriber, Upstream.Output == S.Input, S.Failure == Publishers.TryFirstWhere<Upstream>.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Filter {
//
//    public func filter(_ isIncluded: @escaping (Publishers.Filter<Upstream>.Output) -> Bool) -> Publishers.Filter<Upstream>
//
//    public func tryFilter(_ isIncluded: @escaping (Publishers.Filter<Upstream>.Output) throws -> Bool) -> Publishers.TryFilter<Upstream>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.TryFilter {
//
//    public func filter(_ isIncluded: @escaping (Publishers.TryFilter<Upstream>.Output) -> Bool) -> Publishers.TryFilter<Upstream>
//
//    public func tryFilter(_ isIncluded: @escaping (Publishers.TryFilter<Upstream>.Output) throws -> Bool) -> Publishers.TryFilter<Upstream>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Contains : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A contains publisher to compare for equality.
//    ///   - rhs: Another contains publisher to compare for equality.
//    /// - Returns: `true` if the two publishers’ upstream and output properties are equal, `false` otherwise.
//    public static func == (lhs: Publishers.Contains<Upstream>, rhs: Publishers.Contains<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.CombineLatest : Equatable where A : Equatable, B : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A combineLatest publisher to compare for equality.
//    ///   - rhs: Another combineLatest publisher to compare for equality.
//    /// - Returns: `true` if the corresponding upstream publishers of each combineLatest publisher are equal, `false` otherwise.
//    public static func == (lhs: Publishers.CombineLatest<A, B>, rhs: Publishers.CombineLatest<A, B>) -> Bool
//}
//
///// Returns a Boolean value that indicates whether two publishers are equivalent.
/////
///// - Parameters:
/////   - lhs: A combineLatest publisher to compare for equality.
/////   - rhs: Another combineLatest publisher to compare for equality.
///// - Returns: `true` if the corresponding upstream publishers of each combineLatest publisher are equal, `false` otherwise.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.CombineLatest3 : Equatable where A : Equatable, B : Equatable, C : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.CombineLatest3<A, B, C>, rhs: Publishers.CombineLatest3<A, B, C>) -> Bool
//}
//
///// Returns a Boolean value that indicates whether two publishers are equivalent.
/////
///// - Parameters:
/////   - lhs: A combineLatest publisher to compare for equality.
/////   - rhs: Another combineLatest publisher to compare for equality.
///// - Returns: `true` if the corresponding upstream publishers of each combineLatest publisher are equal, `false` otherwise.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.CombineLatest4 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.CombineLatest4<A, B, C, D>, rhs: Publishers.CombineLatest4<A, B, C, D>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.SetFailureType : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.SetFailureType<Upstream, Failure>, rhs: Publishers.SetFailureType<Upstream, Failure>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Collect : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Collect<Upstream>, rhs: Publishers.Collect<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.CollectByCount : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.CollectByCount<Upstream>, rhs: Publishers.CollectByCount<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.CompactMap {
//
//    public func compactMap<T>(_ transform: @escaping (Output) -> T?) -> Publishers.CompactMap<Upstream, T>
//
//    public func map<T>(_ transform: @escaping (Output) -> T) -> Publishers.CompactMap<Upstream, T>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.TryCompactMap {
//
//    public func compactMap<T>(_ transform: @escaping (Output) throws -> T?) -> Publishers.TryCompactMap<Upstream, T>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge : Equatable where A : Equatable, B : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality..
//    /// - Returns: `true` if the two merging - rhs: Another merging publisher to compare for equality.
//    public static func == (lhs: Publishers.Merge<A, B>, rhs: Publishers.Merge<A, B>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge3 : Equatable where A : Equatable, B : Equatable, C : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality.
//    /// - Returns: `true` if the two merging publishers have equal source publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Merge3<A, B, C>, rhs: Publishers.Merge3<A, B, C>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge4 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality.
//    /// - Returns: `true` if the two merging publishers have equal source publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Merge4<A, B, C, D>, rhs: Publishers.Merge4<A, B, C, D>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge5 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable, E : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality.
//    /// - Returns: `true` if the two merging publishers have equal source publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Merge5<A, B, C, D, E>, rhs: Publishers.Merge5<A, B, C, D, E>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge6 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable, E : Equatable, F : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality.
//    /// - Returns: `true` if the two merging publishers have equal source publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Merge6<A, B, C, D, E, F>, rhs: Publishers.Merge6<A, B, C, D, E, F>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge7 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable, E : Equatable, F : Equatable, G : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality.
//    /// - Returns: `true` if the two merging publishers have equal source publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Merge7<A, B, C, D, E, F, G>, rhs: Publishers.Merge7<A, B, C, D, E, F, G>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Merge8 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable, E : Equatable, F : Equatable, G : Equatable, H : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A merging publisher to compare for equality.
//    ///   - rhs: Another merging publisher to compare for equality.
//    /// - Returns: `true` if the two merging publishers have equal source publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Merge8<A, B, C, D, E, F, G, H>, rhs: Publishers.Merge8<A, B, C, D, E, F, G, H>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.MergeMany : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.MergeMany<Upstream>, rhs: Publishers.MergeMany<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Count : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Count<Upstream>, rhs: Publishers.Count<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.IgnoreOutput : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: An ignore output publisher to compare for equality.
//    ///   - rhs: Another ignore output publisher to compare for equality.
//    /// - Returns: `true` if the two publishers have equal upstream publishers, `false` otherwise.
//    public static func == (lhs: Publishers.IgnoreOutput<Upstream>, rhs: Publishers.IgnoreOutput<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Retry : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Retry<Upstream>, rhs: Publishers.Retry<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.ReplaceEmpty : Equatable where Upstream : Equatable, Upstream.Output : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A replace empty publisher to compare for equality.
//    ///   - rhs: Another replace empty publisher to compare for equality.
//    /// - Returns: `true` if the two publishers have equal upstream publishers and output elements, `false` otherwise.
//    public static func == (lhs: Publishers.ReplaceEmpty<Upstream>, rhs: Publishers.ReplaceEmpty<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.ReplaceError : Equatable where Upstream : Equatable, Upstream.Output : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A replace error publisher to compare for equality.
//    ///   - rhs: Another replace error publisher to compare for equality.
//    /// - Returns: `true` if the two publishers have equal upstream publishers and output elements, `false` otherwise.
//    public static func == (lhs: Publishers.ReplaceError<Upstream>, rhs: Publishers.ReplaceError<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.DropUntilOutput : Equatable where Upstream : Equatable, Other : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.DropUntilOutput<Upstream, Other>, rhs: Publishers.DropUntilOutput<Upstream, Other>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Concatenate : Equatable where Prefix : Equatable, Suffix : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A concatenate publisher to compare for equality.
//    ///   - rhs: Another concatenate publisher to compare for equality.
//    /// - Returns: `true` if the two publishers’ prefix and suffix properties are equal, `false` otherwise.
//    public static func == (lhs: Publishers.Concatenate<Prefix, Suffix>, rhs: Publishers.Concatenate<Prefix, Suffix>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Last : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A last publisher to compare for equality.
//    ///   - rhs: Another last publisher to compare for equality.
//    /// - Returns: `true` if the two publishers have equal upstream publishers, `false` otherwise.
//    public static func == (lhs: Publishers.Last<Upstream>, rhs: Publishers.Last<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.PrefetchStrategy : Equatable {
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.PrefetchStrategy : Hashable {
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Failure == Never {
//
//    public func min(by areInIncreasingOrder: (Publishers.Sequence<Elements, Failure>.Output, Publishers.Sequence<Elements, Failure>.Output) -> Bool) -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//
//    public func max(by areInIncreasingOrder: (Publishers.Sequence<Elements, Failure>.Output, Publishers.Sequence<Elements, Failure>.Output) -> Bool) -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//
//    public func first(where predicate: (Publishers.Sequence<Elements, Failure>.Output) -> Bool) -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements.Element : Equatable {
//
//    public func removeDuplicates() -> Publishers.Sequence<[Publishers.Sequence<Elements, Failure>.Output], Failure>
//
//    public func contains(_ output: Elements.Element) -> Result<Bool, Failure>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Failure == Never, Elements.Element : Comparable {
//
//    public func min() -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//
//    public func max() -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : Collection, Failure == Never {
//
//    public func first() -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//
//    public func output(at index: Elements.Index) -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : Collection {
//
//    public func count() -> Result<Int, Failure>.Publisher
//
//    public func output(in range: Range<Elements.Index>) -> Publishers.Sequence<[Publishers.Sequence<Elements, Failure>.Output], Failure>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : BidirectionalCollection, Failure == Never {
//
//    public func last() -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//
//    public func last(where predicate: (Publishers.Sequence<Elements, Failure>.Output) -> Bool) -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : RandomAccessCollection, Failure == Never {
//
//    public func output(at index: Elements.Index) -> Optional<Publishers.Sequence<Elements, Failure>.Output>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : RandomAccessCollection {
//
//    public func output(in range: Range<Elements.Index>) -> Publishers.Sequence<[Publishers.Sequence<Elements, Failure>.Output], Failure>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : RandomAccessCollection, Failure == Never {
//
//    public func count() -> Just<Int>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : RandomAccessCollection {
//
//    public func count() -> Result<Int, Failure>.Publisher
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence where Elements : RangeReplaceableCollection {
//
//    public func prepend(_ elements: Publishers.Sequence<Elements, Failure>.Output...) -> Publishers.Sequence<Elements, Failure>
//
//    public func prepend<S>(_ elements: S) -> Publishers.Sequence<Elements, Failure> where S : Sequence, Elements.Element == S.Element
//
//    public func prepend(_ publisher: Publishers.Sequence<Elements, Failure>) -> Publishers.Sequence<Elements, Failure>
//
//    public func append(_ elements: Publishers.Sequence<Elements, Failure>.Output...) -> Publishers.Sequence<Elements, Failure>
//
//    public func append<S>(_ elements: S) -> Publishers.Sequence<Elements, Failure> where S : Sequence, Elements.Element == S.Element
//
//    public func append(_ publisher: Publishers.Sequence<Elements, Failure>) -> Publishers.Sequence<Elements, Failure>
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Sequence : Equatable where Elements : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Sequence<Elements, Failure>, rhs: Publishers.Sequence<Elements, Failure>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Zip : Equatable where A : Equatable, B : Equatable {
//
//    /// Returns a Boolean value that indicates whether two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A zip publisher to compare for equality.
//    ///   - rhs: Another zip publisher to compare for equality.
//    /// - Returns: `true` if the corresponding upstream publishers of each zip publisher are equal, `false` otherwise.
//    public static func == (lhs: Publishers.Zip<A, B>, rhs: Publishers.Zip<A, B>) -> Bool
//}
//
///// Returns a Boolean value that indicates whether two publishers are equivalent.
/////
///// - Parameters:
/////   - lhs: A zip publisher to compare for equality.
/////   - rhs: Another zip publisher to compare for equality.
///// - Returns: `true` if the corresponding upstream publishers of each zip publisher are equal, `false` otherwise.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Zip3 : Equatable where A : Equatable, B : Equatable, C : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Zip3<A, B, C>, rhs: Publishers.Zip3<A, B, C>) -> Bool
//}
//
///// Returns a Boolean value that indicates whether two publishers are equivalent.
/////
///// - Parameters:
/////   - lhs: A zip publisher to compare for equality.
/////   - rhs: Another zip publisher to compare for equality.
///// - Returns: `true` if the corresponding upstream publishers of each zip publisher are equal, `false` otherwise.
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Zip4 : Equatable where A : Equatable, B : Equatable, C : Equatable, D : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Zip4<A, B, C, D>, rhs: Publishers.Zip4<A, B, C, D>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Output : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (lhs: Publishers.Output<Upstream>, rhs: Publishers.Output<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.Drop : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value that indicates whether the two publishers are equivalent.
//    ///
//    /// - Parameters:
//    ///   - lhs: A drop publisher to compare for equality..
//    ///   - rhs: Another drop publisher to compare for equality..
//    /// - Returns: `true` if the publishers have equal upstream and count properties, `false` otherwise.
//    public static func == (lhs: Publishers.Drop<Upstream>, rhs: Publishers.Drop<Upstream>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Publishers.First : Equatable where Upstream : Equatable {
//
//    /// Returns a Boolean value that indicates whether two first publishers have equal upstream publishers.
//    ///
//    /// - Parameters:
//    ///   - lhs: A drop publisher to compare for equality.
//    ///   - rhs: Another drop publisher to compare for equality.
//    /// - Returns: `true` if the two publishers have equal upstream publishers, `false` otherwise.
//    public static func == (lhs: Publishers.First<Upstream>, rhs: Publishers.First<Upstream>) -> Bool
//}
//
///// A publisher that allows for recording a series of inputs and a completion for later playback to each subscriber.
//public struct Record<Output, Failure> : Publisher where Failure : Error {
//
//    /// The recorded output and completion.
//    public let recording: Record<Output, Failure>.Recording
//
//    /// Interactively record a series of outputs and a completion.
//    public init(record: (inout Record<Output, Failure>.Recording) -> Void)
//
//    /// Initialize with a recording.
//    public init(recording: Record<Output, Failure>.Recording)
//
//    /// Set up a complete recording with the specified output and completion.
//    public init(output: [Output], completion: Subscribers.Completion<Failure>)
//
//    /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//    ///
//    /// - SeeAlso: `subscribe(_:)`
//    /// - Parameters:
//    ///     - subscriber: The subscriber to attach to this `Publisher`.
//    ///                   once attached it can begin to receive values.
//    public func receive<S>(subscriber: S) where Output == S.Input, Failure == S.Failure, S : Subscriber
//
//    /// A recorded set of `Output` and a `Subscribers.Completion`.
//    public struct Recording {
//
//        public typealias Input = Output
//
//        /// The output which will be sent to a `Subscriber`.
//        public var output: [Output] { get }
//
//        /// The completion which will be sent to a `Subscriber`.
//        public var completion: Subscribers.Completion<Failure> { get }
//
//        /// Set up a recording in a state ready to receive output.
//        public init()
//
//        /// Set up a complete recording with the specified output and completion.
//        public init(output: [Output], completion: Subscribers.Completion<Failure> = .finished)
//
//        /// Add an output to the recording.
//        ///
//        /// A `fatalError` will be raised if output is added after adding completion.
//        public mutating func receive(_ input: Record<Output, Failure>.Recording.Input)
//
//        /// Add a completion to the recording.
//        ///
//        /// A `fatalError` will be raised if more than one completion is added.
//        public mutating func receive(completion: Subscribers.Completion<Failure>)
//    }
//}
//
//extension Record : Codable where Output : Decodable, Output : Encodable, Failure : Decodable, Failure : Encodable {
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    public init(from decoder: Decoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//extension Record.Recording : Codable where Output : Decodable, Output : Encodable, Failure : Decodable, Failure : Encodable {
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    public init(from decoder: Decoder) throws
//
//    public func encode(into encoder: Encoder) throws
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Scheduler {
//
//    /// Performs the action at some time after the specified date, using the scheduler’s minimum tolerance.
//    public func schedule(after date: Self.SchedulerTimeType, _ action: @escaping () -> Void)
//
//    /// Performs the action at the next possible opportunity, without options.
//    public func schedule(_ action: @escaping () -> Void)
//
//    /// Performs the action at some time after the specified date.
//    public func schedule(after date: Self.SchedulerTimeType, tolerance: Self.SchedulerTimeType.Stride, _ action: @escaping () -> Void)
//
//    /// Performs the action at some time after the specified date, at the specified
//    /// frequency, taking into account tolerance if possible.
//    public func schedule(after date: Self.SchedulerTimeType, interval: Self.SchedulerTimeType.Stride, tolerance: Self.SchedulerTimeType.Stride, _ action: @escaping () -> Void) -> Cancellable
//
//    /// Performs the action at some time after the specified date, at the specified
//    /// frequency, using minimum tolerance possible for this Scheduler.
//    public func schedule(after date: Self.SchedulerTimeType, interval: Self.SchedulerTimeType.Stride, _ action: @escaping () -> Void) -> Cancellable
//}
//
//extension Subject where Self.Output == Void {
//
//    /// Signals subscribers.
//    public func send()
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscriber where Self.Input == Void {
//
//    public func receive() -> Subscribers.Demand
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscribers {
//
//    final public class Assign<Root, Input> : Subscriber, Cancellable, CustomStringConvertible, CustomReflectable, CustomPlaygroundDisplayConvertible {
//
//        /// The kind of errors this subscriber might receive.
//        ///
//        /// Use `Never` if this `Subscriber` cannot receive errors.
//        public typealias Failure = Never
//
//        final public var object: Root? { get }
//
//        final public let keyPath: ReferenceWritableKeyPath<Root, Input>
//
//        /// A textual representation of this instance.
//        ///
//        /// Calling this property directly is discouraged. Instead, convert an
//        /// instance of any type to a string by using the `String(describing:)`
//        /// initializer. This initializer works with any type, and uses the custom
//        /// `description` property for types that conform to
//        /// `CustomStringConvertible`:
//        ///
//        ///     struct Point: CustomStringConvertible {
//        ///         let x: Int, y: Int
//        ///
//        ///         var description: String {
//        ///             return "(\(x), \(y))"
//        ///         }
//        ///     }
//        ///
//        ///     let p = Point(x: 21, y: 30)
//        ///     let s = String(describing: p)
//        ///     print(s)
//        ///     // Prints "(21, 30)"
//        ///
//        /// The conversion of `p` to a string in the assignment to `s` uses the
//        /// `Point` type's `description` property.
//        final public var description: String { get }
//
//        /// The custom mirror for this instance.
//        ///
//        /// If this type has value semantics, the mirror should be unaffected by
//        /// subsequent mutations of the instance.
//        final public var customMirror: Mirror { get }
//
//        /// A custom playground description for this instance.
//        final public var playgroundDescription: Any { get }
//
//        public init(object: Root, keyPath: ReferenceWritableKeyPath<Root, Input>)
//
//        /// Tells the subscriber that it has successfully subscribed to the publisher and may request items.
//        ///
//        /// Use the received `Subscription` to request items from the publisher.
//        /// - Parameter subscription: A subscription that represents the connection between publisher and subscriber.
//        final public func receive(subscription: Subscription)
//
//        /// Tells the subscriber that the publisher has produced an element.
//        ///
//        /// - Parameter input: The published element.
//        /// - Returns: A `Demand` instance indicating how many more elements the subcriber expects to receive.
//        final public func receive(_ value: Input) -> Subscribers.Demand
//
//        /// Tells the subscriber that the publisher has completed publishing, either normally or with an error.
//        ///
//        /// - Parameter completion: A `Completion` case indicating whether publishing completed normally or with an error.
//        final public func receive(completion: Subscribers.Completion<Never>)
//
//        /// Cancel the activity.
//        final public func cancel()
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscribers.Completion : Equatable where Failure : Equatable {
//
//    /// Returns a Boolean value indicating whether two values are equal.
//    ///
//    /// Equality is the inverse of inequality. For any values `a` and `b`,
//    /// `a == b` implies that `a != b` is `false`.
//    ///
//    /// - Parameters:
//    ///   - lhs: A value to compare.
//    ///   - rhs: Another value to compare.
//    public static func == (a: Subscribers.Completion<Failure>, b: Subscribers.Completion<Failure>) -> Bool
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscribers.Completion : Hashable where Failure : Hashable {
//
//    /// The hash value.
//    ///
//    /// Hash values are not guaranteed to be equal across different executions of
//    /// your program. Do not save hash values to use during a future execution.
//    ///
//    /// - Important: `hashValue` is deprecated as a `Hashable` requirement. To
//    ///   conform to `Hashable`, implement the `hash(into:)` requirement instead.
//    public var hashValue: Int { get }
//
//    /// Hashes the essential components of this value by feeding them into the
//    /// given hasher.
//    ///
//    /// Implement this method to conform to the `Hashable` protocol. The
//    /// components used for hashing must be the same as the components compared
//    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
//    /// with each of these components.
//    ///
//    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
//    ///   compile-time error in the future.
//    ///
//    /// - Parameter hasher: The hasher to use when combining the components
//    ///   of this instance.
//    public func hash(into hasher: inout Hasher)
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscribers.Completion : Encodable where Failure : Encodable {
//
//    /// Encodes this value into the given encoder.
//    ///
//    /// If the value fails to encode anything, `encoder` will encode an empty
//    /// keyed container in its place.
//    ///
//    /// This function throws an error if any values are invalid for the given
//    /// encoder's format.
//    ///
//    /// - Parameter encoder: The encoder to write data to.
//    public func encode(to encoder: Encoder) throws
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscribers.Completion : Decodable where Failure : Decodable {
//
//    /// Creates a new instance by decoding from the given decoder.
//    ///
//    /// This initializer throws an error if reading from the decoder fails, or
//    /// if the data read is corrupted or otherwise invalid.
//    ///
//    /// - Parameter decoder: The decoder to read data from.
//    public init(from decoder: Decoder) throws
//}
//
///// MARK: -
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//public enum Subscriptions {
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Subscriptions {
//
//    /// Returns the 'empty' subscription.
//    ///
//    /// Use the empty subscription when you need a `Subscription` that ignores requests and cancellation.
//    public static var empty: Subscription { get }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Optional {
//
//    /// A publisher that publishes an optional value to each subscriber exactly once, if the optional has a value.
//    ///
//    /// In contrast with `Just`, an `Optional` publisher may send no value before completion.
//    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//    public struct Publisher : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Wrapped
//
//        /// The kind of errors this publisher might publish.
//        ///
//        /// Use `Never` if this `Publisher` does not publish errors.
//        public typealias Failure = Never
//
//        /// The result to deliver to each subscriber.
//        public let output: Wrapped?
//
//        /// Creates a publisher to emit the optional value of a successful result, or fail with an error.
//        ///
//        /// - Parameter result: The result to deliver to each subscriber.
//        public init(_ output: Optional<Wrapped>.Publisher.Output?)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Wrapped == S.Input, S : Subscriber, S.Failure == Optional<Wrapped>.Publisher.Failure
//    }
//}
//
//@available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//extension Result {
//
//    public var publisher: Result<Success, Failure>.Publisher { get }
//
//    /// A publisher that publishes an output to each subscriber exactly once then finishes, or fails immediately without producing any elements.
//    ///
//    /// If `result` is `.success`, then `Once` waits until it receives a request for at least 1 value before sending the output. If `result` is `.failure`, then `Once` sends the failure immediately upon subscription.
//    ///
//    /// In contrast with `Just`, a `Once` publisher can terminate with an error instead of sending a value.
//    /// In contrast with `Optional`, a `Once` publisher always sends one value (unless it terminates with an error).
//    @available(OSX 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
//    public struct Publisher : Publisher {
//
//        /// The kind of values published by this publisher.
//        public typealias Output = Success
//
//        /// The result to deliver to each subscriber.
//        public let result: Result<Success, Failure>
//
//        /// Creates a publisher that delivers the specified result.
//        ///
//        /// If the result is `.success`, the `Once` publisher sends the specified output to all subscribers and finishes normally. If the result is `.failure`, then the publisher fails immediately with the specified error.
//        /// - Parameter result: The result to deliver to each subscriber.
//        public init(_ result: Result<Result<Success, Failure>.Publisher.Output, Failure>)
//
//        /// Creates a publisher that sends the specified output to all subscribers and finishes normally.
//        ///
//        /// - Parameter output: The output to deliver to each subscriber.
//        public init(_ output: Result<Success, Failure>.Publisher.Output)
//
//        /// Creates a publisher that immediately terminates upon subscription with the given failure.
//        ///
//        /// - Parameter failure: The failure to send when terminating.
//        public init(_ failure: Failure)
//
//        /// This function is called to attach the specified `Subscriber` to this `Publisher` by `subscribe(_:)`
//        ///
//        /// - SeeAlso: `subscribe(_:)`
//        /// - Parameters:
//        ///     - subscriber: The subscriber to attach to this `Publisher`.
//        ///                   once attached it can begin to receive values.
//        public func receive<S>(subscriber: S) where Success == S.Input, Failure == S.Failure, S : Subscriber
//    }
//}
//
