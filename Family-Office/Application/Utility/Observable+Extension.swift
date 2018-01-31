//
//  Observable+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 28/01/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//
import Foundation
import RxSwift
import RxCocoa
import Apollo
extension ObservableType where E == Bool {
    /// Boolean not operator
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
    
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
}

extension ObservableType {
    
    func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete(_ view: UIViewController) -> Driver<E> {
        return asDriver { error in
            print(type(of: error))
            if let e = error as? RxApolloError, case RxApolloError.graphQLErrors(let errors) = e {
              let alertController = UIAlertController(title: "Error", message: errors.first?.message, preferredStyle: .alert)
             view.present(alertController, animated: true, completion: nil)
            }
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
}

