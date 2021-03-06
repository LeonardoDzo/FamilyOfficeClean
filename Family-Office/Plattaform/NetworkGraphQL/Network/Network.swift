//
//  Network.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import RxSwift
import Apollo
final class Network<T: Decodable> {
    private let apollo: ApolloClient!
    private let scheduler: ConcurrentDispatchQueueScheduler

    init(_ apollo: ApolloClient) {
        self.apollo = apollo
        
        self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
    }
    
    
    func getItems<Q: GraphQLQuery>(_ query: Q) -> Observable<[T]> {
        return apollo.rx.fetch(query: query)
            .debug()
            .observeOn(scheduler)
            .map { (data) -> [T] in
                let result = try JSONDecoder().decode([String: [T]].self, from: data.snapshot.jsonObject.jsonToData()!).first?.value ?? JSONDecoder().decode( [T].self, from: data.snapshot.jsonObject.jsonToData()!)
                return result
            }.asObservable()
    }
    
    /// Se espera recibir de API json tipo [String: [String:[T]]]
    ///
    /// - Parameter query: GraphqlQuery
    /// - Returns: [T]
    func getItems_v2<Q: GraphQLQuery>(_ query: Q) -> Observable<[T]> {
        
        return apollo.rx.fetch(query: query)
            .debug()
            .observeOn(scheduler)
            .map { (data) -> [T] in
                let result = try JSONDecoder().decode([String: [[String: T]]].self, from: data.snapshot.jsonObject.jsonToData()!).flatMap({$0.value.flatMap({$0.flatMap({$0.value})})})
                return result
            }.asObservable()
    }


    func getItem<Q: GraphQLQuery>(_ query: Q) -> Observable<T> {

        return apollo.rx.fetch(query: query)
            .debug()
            .observeOn(scheduler)
            .map({ (data) -> T in
                return try JSONDecoder().decode(T.self, from: data.snapshot.jsonToData()!)
            }).asObservable()
    }

    func postItem<M: GraphQLMutation>(_ query: M, files: [GraphQLFile]? = []) -> Observable<T> {
        return apollo.rx.perform(mutation: query, files: files)
            .debug()
            .observeOn(scheduler)
            .map({ (data) -> T in
                let user = try JSONDecoder().decode([String: T].self, from: data.snapshot.jsonObject.jsonToData()!).first?.value ?? JSONDecoder().decode(T.self, from: data.snapshot.jsonObject.jsonToData()!)
                return user
            }).asObservable()
    }
}
