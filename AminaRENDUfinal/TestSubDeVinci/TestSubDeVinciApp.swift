//
//  TestSubDeVinciApp.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//

import SwiftUI

@main
struct TestSubDeVinciApp: App {
    //@StateObject private var dataController = UserController()
    var body: some Scene {
        WindowGroup {
            MainView()
            // Environement : data de base au lancement de l'application
                //.environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
