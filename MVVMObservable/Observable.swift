//
//  Observable.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import Foundation

class Observable {
    private var closure: ((String) -> Void)?
    
    var email: String {
        didSet {
            closure?(email)
        }
    }
    
    init(_ email: String) {
        self.email = email
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        self.closure = closure
    }
}
