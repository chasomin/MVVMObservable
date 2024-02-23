//
//  UserInputViewController.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import UIKit

class UserInputViewController: UIViewController {

    let mainView = UserInputView()
    let viewModel = UserInputViewModel()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
        
        viewModel.output.bind { result in
            self.mainView.resultLabel.text = result
        }

    }
    
    @objc func textFieldChanged() {
        guard let userText = mainView.textField.text else { return }
        viewModel.input.text = userText
        
    }

}
