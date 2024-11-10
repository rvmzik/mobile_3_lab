//
//  UserViewModel.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//

import SwiftUI

struct User1: Identifiable {
    let id = UUID()
    let name: String
}

class UserViewModel: ObservableObject {
    @Published var users: [User1] = []
    
    func loadUsers() {
        users = [
            User1(name: "Yuji"),
            User1(name: "Gojo"),
            User1(name: "Sukuna"),
            User1(name: "Yuta"),
            User1(name: "Maki")
        ]
    }
}

struct UserListView: View {
    @StateObject private var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.users) { user in
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
        }
        .onAppear {
            viewModel.loadUsers()
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
