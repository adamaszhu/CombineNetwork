/// Just.swift
/// CombineRx
///
/// - author: Adamas Zhu
/// - date: 7/11/19

import RxCocoa
import RxSwift

/// A publisher that emits an output to each subscriber just once, and then finishes.
///
/// You can use a `Just` publisher to start a chain of publishers. A `Just` publisher is also useful when replacing a value with `Catch`.
///
/// In contrast with `Publishers.Once`, a `Just` publisher cannot fail with an error.
public struct Just<Output> : Publisher {
    
    public let observable: Observable<Output>
    
    /// The kind of errors this publisher might publish.
    ///
    /// Use `Never` if this `Publisher` does not publish errors.
    public typealias Failure = Never
    
    /// Initializes a publisher that emits the specified output just once.
    ///
    /// - Parameter output: The one element that the publisher emits.
    public init(_ output: Output) {
        observable = Observable.of(output)
    }
}
