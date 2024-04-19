//
//  UserViewModel.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    
    var storageModel = UserController.shared
    @Published var userName: String = ""
    @Published var password: String = ""
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var isAdmin: Bool = Bool()
    @Published var id: UUID = UUID()


    func deleteUser(id: UUID) {
        storageModel.removeUser(id: id)
       // storageModel.remove(user: user)
    }
    
    func getAllUsers() -> [UsersStorage] {
        storageModel.getAllUsers()
    }
    
    func signUp() {
            UserController.shared.signUp(firstName: firstName, familyName: familyName, userName: userName, password: password, isAdmin: isAdmin)
            firstName = ""
            familyName = ""
            userName = ""
            password = ""
            isAdmin = false
        }

        func login() -> Bool {
            return UserController.shared.login(userName: userName, password: password)
        }
    
}
