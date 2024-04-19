//
//  loginFormUser.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import Foundation
import SwiftUI

struct AddUsers: View {
    @State var isConnected: Bool = true
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors:[]) var users: FetchedResults<UsersStorage>
    @StateObject var viewModel = UserViewModel()
    @State private var isOn = false


        var body: some View {
            NavigationView {
                VStack {
                    Form {
                        TextField("First Name: ", text: $viewModel.firstName)
                        TextField("Family Name: ", text: $viewModel.familyName)
                        Toggle("Administrateur", isOn: $viewModel.isAdmin)
                        
                        Button("Submit") {
                            viewModel.getAllUsers()
                            
                        }
                        .disabled(viewModel.firstName.isEmpty || viewModel.familyName.isEmpty)
                    }
                }
                .navigationTitle("Ajouter un Utilisateur")
            }
        }
    }
#Preview {
    AddUsers()
}
