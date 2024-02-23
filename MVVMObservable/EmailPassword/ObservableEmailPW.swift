//
//  ObservableEmailPW.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/23/24.
//

import Foundation

class ObservableEmailPW<T> {
    private var closure: ((T) -> Void)?
    var value: T {
        didSet {
            closure?(value)
        }
    }
    init(value: T) {
        self.value = value
    }
    
    func bind(_ closure: @escaping ((T) -> Void)) {
        closure(value)
        self.closure = closure
    }
    
}
