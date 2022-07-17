//
//  ContentView.swift
//  book-app
//
//  Created by Tomi Antoljak on 7/15/22.
//

import SwiftUI

struct ContentView: View {
    // this enables the view to listen to the changes in the BookModel viewmodel
    @EnvironmentObject var model: BookModel
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(model.books) { book in
                        NavigationLink(destination: BookCard(book: book), label: {
                            ZStack(alignment: .leading) {
                                Rectangle()
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                                    .shadow(color: .gray, radius: 5, x: -5, y: 5)
                                VStack (alignment: .leading, spacing: 10){
                                    HStack {
                                        // HStack here because if the book is favorite then on the far right side of the card we'll have a filled star
                                        Text(book.title)
                                            .font(.title)
                                            .bold()
                                        // extends one thing to the left and the other to the right as much as is allowed
                                        Spacer()
                                        if book.isFavourite {
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                                .foregroundColor(.yellow)
                                        }
                                    }
                                    Text(book.author)
                                        .italic()
                                    Image(book.image)
                                        .resizable()
                                        .scaledToFit()
                                }
                                .padding()
                            }
                            .accentColor(.black)
                        }
                        )
                    }
                }
            }
            .navigationTitle("My Library")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        // this we do just to load data into the preview
            .environmentObject(BookModel())
    }
}
