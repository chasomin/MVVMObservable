//
//  Observable2.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/23/24.
//

import Foundation

class Observable2 {
    var closure: ((String) -> Void)?
    
    var text: String {
        didSet {
            closure?(text)
        }
    }
    
    init(text: String) {
        self.text = text
    }
    
    func bind(_ closure: @escaping (String) -> Void) {
        print(#function)
        closure(text)
        self.closure = closure
    }
}
