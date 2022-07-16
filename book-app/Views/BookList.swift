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
                            VStack {
                                Text(book.title)
                                Text(book.author)
                                Image(book.image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                        )
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BookModel())
    }
}
