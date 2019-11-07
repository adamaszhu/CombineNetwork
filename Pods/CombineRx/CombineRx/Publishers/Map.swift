/// Map.swift
/// CombineRx
///
/// - author: Adamas Zhu
/// - date: 7/11/19

import RxCocoa
import RxSwift

extension Publishers {
    
    /// A publisher that transforms all elements from the upstream publisher with a provided closure.
    public struct Map<Upstream, Output> : Publisher where Upstream : Publisher {
        
        public let observable: Observable<Output>
        
        /// The kind of errors this publisher might publish.
        ///
        /// Use `Never` if this `Publisher` does not publish errors.
        public typealias Failure = Upstream.Failure
        
        public init(upstream: Upstream, transform: @escaping (Upstream.Output) -> Output) {
            observable = upstream.observable
                .map(transform)
        }
        
        fileprivate init<PreviousUpstream, PreviousOutput>(publisher: Publishers.Map<PreviousUpstream, PreviousOutput>, transform: @escaping (PreviousOutput) -> Output) {
            observable = publisher.observable.map(transform)
        }
        
        fileprivate init<PreviousUpstream, PreviousOutput>(publisher: Publishers.TryMap<PreviousUpstream, PreviousOutput>, transform: @escaping (PreviousOutput) -> Output) {
            observable = publisher.observable.map(transform)
        }
    }
    
    /// A publisher that transforms all elements from the upstream publisher with a provided error-throwing closure.
    public struct TryMap<Upstream, Output> : Publisher where Upstream : Publisher {
        
        public let observable: Observable<Output>
        
        /// The kind of errors this publisher might publish.
        ///
        /// Use `Never` if this `Publisher` does not publish errors.
        public typealias Failure = Error
        
        public init(upstream: Upstream, transform: @escaping (Upstream.Output) throws -> Output) {
            observable = upstream.observable
                .map(transform)
        }
        
        fileprivate init<PreviousUpstream, PreviousOutput>(publisher: Publishers.Map<PreviousUpstream, PreviousOutput>, transform: @escaping (PreviousOutput) throws -> Output) {
            observable = publisher.observable.map(transform)
        }
        
        fileprivate init<PreviousUpstream, PreviousOutput>(publisher: Publishers.TryMap<PreviousUpstream, PreviousOutput>, transform: @escaping (PreviousOutput) throws -> Output) {
            observable = publisher.observable.map(transform)
        }
    }
}

extension Publisher {
    
    /// Transforms all elements from the upstream publisher with a provided closure.
    ///
    /// - Parameter transform: A closure that takes one element as its parameter and returns a new element.
    /// - Returns: A publisher that uses the provided closure to map elements from the upstream publisher to new elements that it then publishes.
    public func map<T>(_ transform: @escaping (Self.Output) -> T) -> Publishers.Map<Self, T> {
        return Publishers.Map(upstream: self, transform: transform)
    }
    
    /// Transforms all elements from the upstream publisher with a provided error-throwing closure.
    ///
    /// If the `transform` closure throws an error, the publisher fails with the thrown error.
    /// - Parameter transform: A closure that takes one element as its parameter and returns a new element.
    /// - Returns: A publisher that uses the provided closure to map elements from the upstream publisher to new elements that it then publishes.
    public func tryMap<T>(_ transform: @escaping (Self.Output) throws -> T) -> Publishers.TryMap<Self, T> {
        return Publishers.TryMap(upstream: self, transform: transform)
    }
}

extension Publishers.Map {
    
    public func map<T>(_ transform: @escaping (Output) -> T) -> Publishers.Map<Upstream, T> {
        return Publishers.Map(publisher: self, transform: transform)
    }
    
    public func tryMap<T>(_ transform: @escaping (Output) throws -> T) -> Publishers.TryMap<Upstream, T> {
        return Publishers.TryMap(publisher: self, transform: transform)
    }
}

extension Publishers.TryMap {
    
    public func map<T>(_ transform: @escaping (Output) -> T) -> Publishers.TryMap<Upstream, T> {
        return Publishers.TryMap(publisher: self, transform: transform)
    }
    
    public func tryMap<T>(_ transform: @escaping (Output) throws -> T) -> Publishers.TryMap<Upstream, T> {
        return Publishers.TryMap(publisher: self, transform: transform)
    }
}

