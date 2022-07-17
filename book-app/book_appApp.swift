//
//  book_appApp.swift
//  book-app
//
//  Created by Tomi Antoljak on 7/15/22.
//

import SwiftUI

@main
struct book_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(BookModel())
        }
    }
}
