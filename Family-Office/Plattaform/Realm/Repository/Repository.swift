//
//  Repository.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 30/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Realm
import RealmSwift
import RxSwift
import RxRealm

protocol AbstractRepository {
    associatedtype T
    func queryAll() -> Observable<[T]>
    func query(uid: String) -> Observable<T>
    func query(with predicate: NSPredicate,
               sortDescriptors: [NSSortDescriptor]) -> Observable<[T]>
    func save(entity: T) -> Observable<Void>
    func delete(entity: T) ->  Observable<Void>
}

final class Repository<T:RealmRepresentable>: AbstractRepository where T == T.RealmType.DomainType, T.RealmType: Object {

    private let configuration: Realm.Configuration
    private let scheduler: RunLoopThreadScheduler!
    
    private var realm: Realm {
        let realm = try! Realm(configuration: self.configuration)
        return  realm
    }
    
    init(configuration: Realm.Configuration) {
        self.configuration = configuration
       
        self.scheduler = RunLoopThreadScheduler.sharedInstance
        print("File 📁 url: \(RLMRealmPathForFile("default.realm"))")
    }
    
    func queryAll() -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(T.RealmType.self)
            
            return Observable.array(from: objects)
                .mapToDomain()
            }
            .observeOn(self.scheduler)
    }
    
    func query(uid: String) -> Observable<T> {
        return Observable.deferred {
            let realm = self.realm
            let object = realm.object(ofType: T.RealmType.self, forPrimaryKey: uid)!
            return BehaviorSubject(value: object.asDomain()).asObserver()
            }
            .subscribeOn(scheduler)
            .observeOn(scheduler)
            
    }
    
    func query(with predicate: NSPredicate,
               sortDescriptors: [NSSortDescriptor] = []) -> Observable<[T]> {
        return Observable.deferred {
            let realm = self.realm
            let objects = realm.objects(T.RealmType.self)
            return Observable.array(from: objects)
                .mapToDomain()
            }
            .subscribeOn(scheduler)
    }
    
    func save(entity: T) ->  Observable<Void> {
        return Observable.deferred {
            return self.realm.rx.save(entity: entity)
            }
            .subscribeOn(scheduler)
            .observeOn(scheduler)
        
    }
    
    func delete(entity: T) ->  Observable<Void> {
        return Observable.deferred {
            return self.realm.rx.delete(entity: entity)
            }.subscribeOn(scheduler)
    }
}
