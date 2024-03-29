//
//  Observable.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import Foundation

class Observable<T> {
    private var closure: ((T) -> Void)?
    
    var value: T {
        didSet {
            closure?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping (T) -> Void) {
        self.closure = closure
    }
}
