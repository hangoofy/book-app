//
//  BookCard.swift
//  book-app
//
//  Created by Tomi Antoljak on 7/16/22.
//

import SwiftUI

struct BookCard: View {
    var book: Book
    // this enables the view to listen to the changes in the BookModel viewmodel
    @EnvironmentObject var model: BookModel
    // this is how to keep track of changes on the picker
    @State var ratingIndex = 1
    // this is how you get to display data from the book
    var body: some View {
        VStack (spacing: 20) {
            
            NavigationLink(destination: BookText(book: book)) {
                VStack {
                    Text("Click book & read now!")
                        .font(.title)
                    Image("cover\(book.id)")
                    // resizable = for image to fit within available space given its measurements
                        .resizable()
                        .scaledToFit()
                }
            }
            
            Text("Mark for later!")
            // we call method of BookModel viewmodel that takes the book.id as parameter and checks if this id exists within the array of book objects and if it does then we display the filled star and if not just a normal one
            Button(action: { model.updateFavorite(targetId: book.id) }) {
                Image(systemName: book.isFavourite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
                .accentColor(.yellow)
            
            Spacer()
            
            Text("Rate \(book.title)")
                .font(.headline)
            Picker("Rate title: ", selection: $ratingIndex) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
                Text("6").tag(6)
            }
            .pickerStyle(.segmented)
            // when we make change the rating on the picker, we should update the rating for that book
            // if value ratingIndex changes in the code, then call method of the BookModel viewmodel to change that rating in the instance of that specific Book
            // this view already has a specific book (var book:Book) so you call properties of that book to update the rating of that book
            // newRating in has nothing to do with the loop, it's just a way of expressing the closure after perform property
            .onChange(of: ratingIndex, perform: { newRating in
                model.updateRating(targetId: book.id, targetRating: ratingIndex)
            })
        }
        // we just display this on top simple as that
        .navigationBarTitle("\(book.title)")
        // when this view (page) loads for the first time, we want to refresh rating of the book and process that before we display it
        // onAppear esentially allows you to perform changes before we can see the actual UI
        // we do this so that the next time you go back into the BookCard view, the rating stays where it was previously (last) on, otherwise it would be where the rating index is initially set (1)
        .onAppear {
            ratingIndex = book.rating
        }
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: BookModel().books[1])
            .environmentObject(BookModel())
    }
}
