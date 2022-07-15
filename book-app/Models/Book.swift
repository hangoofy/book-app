// model is the first step because we want to create a data pattern based on JSON file that we can play with (meaning manipulate the data, display views, etc)...really everything and anything

import Foundation

// Identifiable = we can loop over
// Decodable = json file can be decoded into class properties
// ? optional just means to return nil if it doesn't exist
// UUID makes sure that every instance of this class (aka object) is unique
class Book: Identifiable, Decodable {
    var id: Int
    var title:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var content:[String]
}
