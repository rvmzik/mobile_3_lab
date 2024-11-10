//
//  ViewModel.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//

import SwiftUI
import Combine


class ViewModel: ObservableObject {
    @Published var inputText: String = ""
}

struct InputView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Input View")
                .font(.headline)
            TextField("Enter some text", text: $viewModel.inputText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}

struct OutputView: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Output View")
                .font(.headline)
            Text(viewModel.inputText.isEmpty ? "No input yet" : viewModel.inputText)
                .padding()
                .foregroundColor(.blue)
        }
    }
}

struct MainView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var showOutputView = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button("\(showOutputView ? "Input" : "Output") View") {
                    showOutputView.toggle()
                }
                .padding()
                if showOutputView {
                    OutputView(viewModel: viewModel)
                } else {
                    InputView(viewModel: viewModel)
                }
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}
