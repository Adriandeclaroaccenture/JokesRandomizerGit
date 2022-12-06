//
//  JokesViewModel.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//


import Foundation

class JokesViewModel: ObservableObject {
    
    private(set) var joke: [JokesModel] = []
    
    func getJokesVM(url: URL) async {
        do {
        let jokes = try await WebService().getJokes(url: url)
            self.joke = jokes
        } catch {
            print(error)
        }
    }

}
//
//struct JKViewModel: Decodable {
//    
//    private let jokes: Jokes
//    
//    init(jokes: Jokes) {
//        self.jokes = jokes
//    }
//    
//    
//    var idno: Int {
//        return jokes.id
//    }
//    
//    var type: String {
//        return jokes.type
//    }
//    
//    var setup: String {
//        return jokes.setup
//    }
//    
//    var punchline: String {
//        return jokes.punchline
//    }
//}


