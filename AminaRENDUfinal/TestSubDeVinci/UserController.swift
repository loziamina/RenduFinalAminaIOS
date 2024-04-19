//
//  UserController.swift
//  TestSubDeVinci
//
//  Created by COURS on 19/04/2024.
//

import CoreData
import Foundation

class UserController: ObservableObject{
    
    static var shared = UserController()
    // un container qui gere les data
    let container = NSPersistentContainer(name:"UsersStorage")
    
    var viewContext : NSManagedObjectContext{
        return container.viewContext
    }
    
    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
    
    func saveUser(firstName: String, familyName: String, isAdmin: Bool, userName: String, password: String) {
        let newUser = UsersStorage(context: container.viewContext)
        newUser.firstName = firstName
        newUser.familyName = familyName
        newUser.isAdmin = isAdmin
        newUser.pseudo = userName
        newUser.password = password
        newUser.id = UUID()

        do {
            try container.viewContext.save()
        } catch {
            print("Failed to save user: \(error)")
        }
    }
    
    func removeUser(id: UUID ){
        let registredUser = UsersStorage(context: viewContext)
        registredUser.id = UUID()

    }
 

    func saveUser(firstName: String, familyName: String, isAdmin: Bool) {
           let newUser = UsersStorage(context: container.viewContext)
           newUser.firstName = firstName
           newUser.familyName = familyName
           newUser.isAdmin = isAdmin
           newUser.id = UUID()

           do {
               try container.viewContext.save()
           } catch {
               print("Failed to save user: \(error)")
           }
       }
       
       func getAllUsers() -> [UsersStorage] {
           let request: NSFetchRequest<UsersStorage> = UsersStorage.fetchRequest()
           do {
               return try container.viewContext.fetch(request)
           } catch {
               print("Failed to fetch users: \(error)")
               return []
           }
       }
    
    
    
    func signUp(firstName: String, familyName: String, userName: String, password: String, isAdmin: Bool) {
        let newUser = UsersStorage(context: container.viewContext)
        newUser.firstName = firstName
        newUser.familyName = familyName
        newUser.pseudo = userName
        newUser.password = password
        newUser.isAdmin = isAdmin
        newUser.id = UUID()

        do {
            try container.viewContext.save()
        } catch {
            print("Failed to save user: \(error)")
        }
    }

    func login(userName: String, password: String) -> Bool {
        let request: NSFetchRequest<UsersStorage> = UsersStorage.fetchRequest()
        request.predicate = NSPredicate(format: "userName == %@ AND password == %@", userName, password)
        
        do {
            let result = try container.viewContext.fetch(request)
            return !result.isEmpty
        } catch {
            print("Login failed: \(error)")
            return false
        }
    }
    
    
    
}
