//
//  EmailPWViewModel.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/23/24.
//

import Foundation

class EmailPWViewModel {
    var input = ObservableEmailPW(value: "")
    
    var output = ObservableEmailPW(value: "")
    var outputVaildColor = ObservableEmailPW(value: false)
    
    init() {
        input.bind { value in
            self.vaildation(value)
        }
    }
    
    private func vaildation(_ text: String) {
        if text.count < 5 {
            output.value = "유효하지 않습니다"
            outputVaildColor.value = false
        } else {
            output.value = text
            outputVaildColor.value = true
        }
        
    }
}
