//
//  EmailPWViewController.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/23/24.
//

import UIKit
import SnapKit

class EmailPWViewController: UIViewController {
    let viewModel = EmailPWViewModel()
    
    let stackView = UIStackView()
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(resultLabel)
        stackView.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(150)
        }
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        emailTextField.backgroundColor = .lightGray
        passwordTextField.backgroundColor = .red
        resultLabel.backgroundColor = .blue
        
        emailTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        viewModel.output.bind { value in
            self.resultLabel.text = value
        }
        viewModel.outputVaildColor.bind { value in
            self.resultLabel.textColor = value ? .green : .red
        }
    }

    // ???: email 과 password가 같은 함수를 쓴다고 하면 어떻게 처리하지ㅣ
    @objc func textFieldChanged(_ sender: UITextField) {
        guard let text = sender.text else { return }
        viewModel.input.value = text
    }

}
