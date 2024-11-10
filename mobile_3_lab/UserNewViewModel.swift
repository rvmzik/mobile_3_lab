//
//  UserNewViewModel.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//

import SwiftUI
import CoreData

class UserNewViewModel: ObservableObject {
    @Published var users: [User] = []
    private var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
        fetchUsers()
    }
    
    func fetchUsers() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        do {
            users = try context.fetch(fetchRequest)
        } catch {
            print("Error fetching users: \(error)")
        }
    }
    
    func addUser(name: String) {
        let newUser = User(context: context)
        newUser.name = name
        
        do {
            try context.save()
            fetchUsers()
        } catch {
            print("Error saving user: \(error)")
        }
    }
}
