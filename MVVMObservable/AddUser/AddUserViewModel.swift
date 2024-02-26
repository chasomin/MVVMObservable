//
//  AddUserViewModel.swift
//  MVVMObservable
//
//  Created by 차소민 on 2/26/24.
//

import Foundation

class AddUserViewModel {
    let userList: Observable<[User]> = Observable([])

    let addButtonTapped: Observable<String?> = Observable(nil)
    let searchButtonTapped: Observable<String?> = Observable(nil)
    let deleteButtonTapped: Observable<Void?> = Observable(nil)
    
    init() {
        addButtonTapped.bind { value in
            guard let value else { return }
            let checkSameNameResult = self.userList.value.filter {
                $0.name.contains(value)
            }
            if checkSameNameResult.isEmpty {
                let user = User(name: value)
                self.userList.value.append(user)
            }
        }
        
        searchButtonTapped.bind { value in
            guard let value else { return }
            self.filterSearchTextUser(value)
        }
        
        deleteButtonTapped.bind { _ in
            self.userList.value.removeAll()
        }
        
        fetchUser()
    }
    
    func fetchUser() {
        userList.value = [
            User(name: "소민"),
            User(name: "지은"),
            User(name: "태영"),
            User(name: "덕훈")
        ]
    }
    
    func filterSearchTextUser(_ text: String) {
        let result = userList.value.filter {
            $0.name.contains(text)
        }
        userList.value = result
    }
}
