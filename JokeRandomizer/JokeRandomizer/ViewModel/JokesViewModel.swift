//
//  JokesViewModel.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//


import Foundation

class JokesViewModel: ObservableObject {
    
    func getJokes(completion: @escaping (JKViewModel) -> Void) {
        
    }

}

struct JKViewModel: Codable {
    
    let jokes: Jokes
    
    var idno: Int {
        return jokes.id
    }
    
    var type: String {
        return jokes.type
    }
    
    var setup: String {
        return jokes.setup
    }
    
    var punchline: String {
        return jokes.punchline
    }
}


