//
//  BookText.swift
//  book-app
//
//  Created by Tomi Antoljak on 7/16/22.
//

import SwiftUI

struct BookText: View {
    var book: Book
    @EnvironmentObject var model:BookModel
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(book.content, id: \.self) {p in
                    Text(p)
                }
            }
        }
    }
}

struct BookText_Previews: PreviewProvider {
    static var previews: some View {
        BookText(book: BookModel().books[1])
            .environmentObject(BookModel())
    }
}
