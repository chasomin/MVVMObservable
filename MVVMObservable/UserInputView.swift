//
//  UserInputView.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/22/24.
//

import UIKit
import SnapKit

class UserInputView: UIView {

    let textField = UITextField()
    let resultLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        addSubview(textField)
        addSubview(resultLabel)
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
        }
        resultLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
    
    func configureView() {
        backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .gray

        resultLabel.backgroundColor = .systemGray6
    }
}
