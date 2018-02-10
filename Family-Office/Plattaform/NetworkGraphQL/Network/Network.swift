//
//  Network.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 29/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Apollo
import RxSwift

final class Network<T: Codable> {
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
            .map{ (data) -> [T] in
                if let data =  data.snapshot.jsonToData() {
                     return try! JSONDecoder().decode([T].self, from: data)
                }
                return []
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
    
    func postItem<M: GraphQLMutation>(_ query: M) -> Observable<T> {
        return apollo.rx.perform(mutation: query)
            .debug()
            .observeOn(scheduler)
            .map({ (data) -> T in
                let user = try JSONDecoder().decode([String: T].self, from: data.snapshot.jsonObject.jsonToData()!).first?.value
                return user!
            }).asObservable()
    }
}
