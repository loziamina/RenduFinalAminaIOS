//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

struct ContentView: View {
    @State var isConnected: Bool = true
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors:[]) var users: FetchedResults<UsersStorage>
    
    @State private var username: String = ""
    
    
    var body: some View {
        NavigationStack{
                        
            NavigationLink("Start The Quiz") {
                FormTestView()
                
            }
            
            .frame(width: 100.0, height: 100.0)
            .background(Color.white)
            .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
            .padding()
            
            NavigationLink("LOGIN OUT") {
                MainView()
            }
            
        }
        }
    
    
    
}

#Preview {
    ContentView()
}
