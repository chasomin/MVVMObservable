//
//  ViewController.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let viewModel = IdViewModel()

    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디를 입력해주세요"
        return textField
    }()
    
    let resultLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(idTextField)
        view.addSubview(resultLabel)
        
        idTextField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
        resultLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(idTextField.snp.bottom)
            make.height.equalTo(50)
        }
        
        idTextField.addTarget(self, action: #selector(idTextFieldChanged), for: .editingChanged)
        
        viewModel.output.bind { value in
            self.resultLabel.text = value
        }
    }
    
    @objc func idTextFieldChanged() {
        viewModel.input.value = idTextField.text!
    }
}

