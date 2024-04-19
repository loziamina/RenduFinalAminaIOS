//
//  AddUsersViewModel.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation


class AddUsersViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var familyName: String = ""
    @Published var isAdmin: Bool = false

    func addUser() {
        UserController.shared.saveUser(firstName: firstName, familyName: familyName, isAdmin: isAdmin)
        firstName = ""
        familyName = ""
        isAdmin = false
    }
}
