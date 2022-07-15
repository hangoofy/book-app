//
//  BookModel.swift
//  book-app
//
//  Created by Tomi Antoljak on 7/15/22.
//

import Foundation

// Typically the view model is a shared instance that may get referenced by multiple views, so you'll want it to be a class. Views will hold a reference to an instance of it either via @ObservedObject, @EnvironmentObject, or @StateObject (for the view that'll maintain the source of truth).
// ObservableObject = property of the ViewModel that lets us listen to it

class BookModel:ObservableObject {
    // @Published wrapper because we want to display its changes on the UIview
    @Published var books = [Book]()
    
    // initializing because we want to fetch that data from DataService and have it here at our disposal
    init() {
        // self is to point to the property (var books) -- that we want to fill that one specifically, just to be sure...
        // we can call it like this because we put static in front of Data Service's method
        self.books = DataService.getLocalData()
    }
}
