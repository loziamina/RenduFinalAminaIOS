//
//  ListUserViewModel.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//



import Foundation

class ListUserViewModel: ObservableObject {
    var model = UserController.shared
    var received: Bool = false
    @Published var users: [UsersStorage] = []
    
    func getUsers() {
        users = model.getAllUsers()
    }
    
    private func getIndex(of element: UsersStorage) -> Int? {
        for (index, users) in users.enumerated() {
           // print("\(users.) se trouve à l'index :\(index)")
            if element.firstName == users.firstName {
                return index
            }
        }
        return nil
    }
    
    func removeUser(user: UsersStorage) {
        let index = getIndex(of: user)
        if let index {
            users.remove(at: index)
        }
        //model.
    }
}
