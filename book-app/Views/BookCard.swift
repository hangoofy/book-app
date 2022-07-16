//
//  BookCard.swift
//  book-app
//
//  Created by Tomi Antoljak on 7/16/22.
//

import SwiftUI

struct BookCard: View {
    // this is how to keep track of changes on the picker
    @State var ratingIndex = 1
    // this is how you get to display data from the book
    var book:Book
    var body: some View {
        VStack (spacing: 20) {
            Text(book.title)
            Text("Read Now!")
            Image(book.image)
                .resizable()
                .scaledToFill()
            Text("Mark for later!")
            // STAR NEEDED HERE TO CHECK & UNCHECK
            Picker("", selection: $ratingIndex) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
            }
            .pickerStyle(.segmented)
        }
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        BookCard(book: model.books[1])
    }
}
