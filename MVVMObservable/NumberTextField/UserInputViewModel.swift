//
//  UserInputViewModel.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import Foundation

class UserInputViewModel {
    
    var input = Observable2(text: "")
    var output = Observable2(text: "")
    
    init() {
        input.bind { result in
            self.vaildation(result)
        }
    }
    
    func vaildation(_ input: String) {
        if input.isEmpty {
            output.text = "숫자를 입력해주세요"
        }
        guard let input = Int(input) else {
            output.text = "숫자만 입력 가능합니다"
            return
        }
        if input > 0 {
            let format = NumberFormatter()
            format.numberStyle = .decimal
            let result = format.string(for: input)
            if let result {
                output.text = result
            }
        }
    }
}
