//
//  UserInputViewModel.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//

import SwiftUI

class UserInputViewModel: ObservableObject {
    @Published var userInput: String = ""
}

struct UserInputView: View {
    @StateObject private var viewModel = UserInputViewModel()
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $viewModel.userInput)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: {

                print("User input: \(viewModel.userInput)")
            }) {
                Text("Submit")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            Text("You entered: \(viewModel.userInput)")
                .padding(.top)
        }
        .navigationTitle("User Input")
    }
}

struct UserInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserInputView()
    }
}
