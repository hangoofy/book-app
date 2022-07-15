
// this is the second step after we have established the structure of Book Class -- now we are going to decode JSON data
// this file reworks raw json data so we can display it, change it, etc
import Foundation

class DataService {
    // static in front so we don't need to create an instance of this class to call the function
    // we can just call it on this class name such as DataService.getLocalData()
    // this function returns an array of Book type
    static func getLocalData() -> [Book] {
        // 1. get path of the JSON file
        // let is local (within the function), var is global (outside of function) so if we made this var then we wouldn't be able to use path outside -- I mean we could but it would just be the path of this JSON file
        let jsonPath = Bundle.main.path(forResource: "Data", ofType: "json")
        
        // 2. if it's empty, return an empty array
        guard jsonPath != nil else {
            return [Book]()
        }
        
        // 3. create url
        // ! because jsonPath is by default an optional type String? so we have to unwrap it
        let url = URL(fileURLWithPath: jsonPath!)
        
        // 4. need do try catch because parsing JSON data may give us an error - just a common practice
        do {
            // 5. now we create workable data --> data object which we can work it inside this class in a proper form
            // try is just a standard syntax for do try catch
            let data = try Data(contentsOf: url)
            // 6. now we decode that data so we can loop over them and display them later
            // also again do catch try because it may throw an error...
            do {
                let bookData = try JSONDecoder().decode([Book].self, from: data)
                
                return bookData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Book]()
    }
}


