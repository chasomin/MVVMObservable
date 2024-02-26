//
//  IdViewModel.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import Foundation

class IdViewModel {
    
    var input = Observable("")
    var output = Observable("")
    
    init() {
        input.bind { value in
            self.vaildation(value)
        }
    }
    
    func vaildation(_ input: String) {
        print(#function)
        if input.isEmpty {
            output.value = "아이디를 입력해주세요"
        }
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if input.range(of: regex, options: .regularExpression) != nil {
            output.value = input
        } else {
            output.value = "이메일 형식을 지켜주세요"
        }
        
    }
    
}
