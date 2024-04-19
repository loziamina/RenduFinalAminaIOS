//
//  MainView.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        NavigationStack{
            NavigationLink("Log In") {
                LoginFormUser()
                
            }
            
            NavigationLink("Sign Up") {
                SignUpView()
                
            }
        }


    }
}

#Preview {
    MainView()
}
