//
//  ContentView.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = UserNewViewModel(context: PersistenceController.shared.container.viewContext)
    @State private var newUserName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Список пользователей
                List(viewModel.users) { user in
                    Text(user.name ?? "Unknown")
                }
                
                // Поле ввода для нового пользователя
                TextField("Enter user name", text: $newUserName)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                // Кнопка для добавления нового пользователя
                Button(action: {
                    guard !newUserName.isEmpty else { return }
                    viewModel.addUser(name: newUserName)
                    newUserName = "" // Очищаем поле ввода
                }) {
                    Text("Add User")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationTitle("Users")
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
