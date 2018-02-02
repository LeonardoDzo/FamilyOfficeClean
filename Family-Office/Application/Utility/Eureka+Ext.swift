//
//  Eureka+Ext.swift
//  Family-Office
//
//  Created by Leonardo Durazo on 01/02/18.
//  Copyright © 2018 Leonardo Durazo. All rights reserved.
//

import Foundation
import Eureka
import RxSwift
import RxCocoa
extension RowOf: ReactiveCompatible {}

extension Reactive where Base: RowType, Base: BaseRow {
    var value: ControlProperty<Base.Cell.Value?> {
        let source = Observable<Base.Cell.Value?>.create { observer in
            self.base.onChange { row in
                observer.onNext(row.value)
            }
            return Disposables.create()
        }
        let bindingObserver = Binder(self.base) { (row, value) in
            row.value = value
        }
        return ControlProperty(values: source, valueSink: bindingObserver)
    }
}
