//
//  ParentView.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//

import SwiftUI

struct ParentView: View {
    @State private var showFirstView = true
    
    var body: some View {
        VStack {
            HStack {
                Button("First View") {
                    withAnimation {
                        showFirstView = true
                    }
                }
                .padding()
                
                Button("Second View") {
                    withAnimation {
                        showFirstView = false
                    }
                }
                .padding()
            }
            .background(Color.gray.opacity(0.2))
            ZStack {
                if showFirstView {
                    FirstChildView()
                        .transition(.opacity)
                        .edgesIgnoringSafeArea(.all)
                } else {
                    SecondChildView()
                        .transition(.opacity)
                        .edgesIgnoringSafeArea(.all)
                }
            }
            .animation(.easeInOut, value: showFirstView)
        }
    }
}


struct FirstChildView: View {
    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)
            Text("First View")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}


struct SecondChildView: View {
    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}


struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
