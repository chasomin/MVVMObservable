//
//  AddUserViewController.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/26/24.
//

import UIKit
import SnapKit

class AddUserViewController: UIViewController {
    
    let viewModel = AddUserViewModel()
    
    let searchTextField = UITextField()
    let addTextField = UITextField()
    let searchButton = UIButton()
    let addButton = UIButton()
    let deleteButton = UIButton()
    let tableView = UITableView(frame: .zero, style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "addCell")

        configureHierarchy()
        configureLayout()
        configureView()
        
        bindData()
        
        
    }

    func bindData() {
        viewModel.userList.bind { _ in
            self.tableView.reloadData()
        }
    }
    
    func configureHierarchy() {
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(addTextField)
        view.addSubview(addButton)
        view.addSubview(deleteButton)
        view.addSubview(tableView)
    }
    
    func configureLayout() {
        searchTextField.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(30)
        }
        searchButton.snp.makeConstraints { make in
            make.leading.equalTo(searchTextField.snp.trailing)
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(50)
        }
        addTextField.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.top.equalTo(searchTextField.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        addButton.snp.makeConstraints { make in
            make.top.equalTo(searchButton.snp.bottom).offset(10)
            make.leading.equalTo(addTextField.snp.trailing)
            make.height.equalTo(30)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(50)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(deleteButton.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureView() {
        searchButton.backgroundColor = .blue
        searchButton.setTitle("검색", for: .normal)
        addButton.backgroundColor = .red
        addButton.setTitle("추가", for: .normal)
        addTextField.backgroundColor = .gray
        searchTextField.backgroundColor = .gray
        deleteButton.setTitle("삭제", for: .normal)
        deleteButton.backgroundColor = .brown
        
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
    }
    
    @objc func deleteButtonTapped() {
        //TODO: Delete
    }
    
    @objc func searchButtonTapped() {
        viewModel.searchButtonTapped.value = searchTextField.text
        print(#function)
    }
    
    @objc func addButtonTapped() {
        viewModel.addButtonTapped.value = addTextField.text

    }


}

extension AddUserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.userList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "addCell")!
        cell.textLabel?.text = viewModel.userList.value[indexPath.row].name

        
        return cell
    }
}
