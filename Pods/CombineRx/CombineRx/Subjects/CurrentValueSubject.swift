/// CurrentValueSubject.swift
/// CombineRx
///
/// - author: Adamas Zhu
/// - date: 7/11/19

import RxCocoa
import RxSwift

/// A subject that wraps a single value and publishes a new element whenever the value changes.
final public class CurrentValueSubject<Output, Failure> : Subject where Failure : Error {
    
    public let observable: Observable<Output>
    public let behaviourSubject: BehaviorSubject<Output>
    
    /// Creates a current value subject with the given initial value.
    ///
    /// - Parameter value: The initial value to publish.
    public init(_ value: Output) {
        behaviourSubject = BehaviorSubject(value: value)
        observable = behaviourSubject.asObserver()
    }
    
    /// Provides this Subject an opportunity to establish demand for any new upstream subscriptions (say via, ```Publisher.subscribe<S: Subject>(_: Subject)`
    // final public func send(subscription: Subscription)
    
    /// Sends a value to the subscriber.
    ///
    /// - Parameter value: The value to send.
    // final public func send(_ input: Output)
    
    /// Sends a completion signal to the subscriber.
    ///
    /// - Parameter completion: A `Completion` instance which indicates whether publishing has finished normally or failed with an error.
    // final public func send(completion: Subscribers.Completion<Failure>)
}
