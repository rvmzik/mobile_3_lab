//
//  Movie.swift
//  mobile_3_lab
//
//  Created by Рамазан Алиев on 10.11.2024.
//
import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
}

struct MovieRow: View {
    let movie: Movie
    var body: some View {
        HStack {
            Text(movie.title)
                .font(.headline)
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(8)
    }
}

struct MovieListView: View {

    let movies = [
        Movie(title: "Venom 3"),
        Movie(title: "Avengers doomsday"),
        Movie(title: "Interstellar"),
        Movie(title: "The Dark Knight"),
        Movie(title: "Avengers 1"),
        Movie(title: "Avengers 2"),
        Movie(title: "Avengers endgame"),
        Movie(title: "The walking dead"),
        Movie(title: "The Lord of the Rings")
    ]
    
    @State private var selectedMovie: Movie? = nil

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    ForEach(movies) { movie in
                        MovieRow(movie: movie)
                            .onTapGesture {
                                selectedMovie = movie
                            }
                    }
                }
                .padding()
            }
            .navigationTitle("Favorite Movies")
            .alert(item: $selectedMovie) { movie in
                Alert(
                    title: Text("You clicked on:"),
                    message: Text(movie.title),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
