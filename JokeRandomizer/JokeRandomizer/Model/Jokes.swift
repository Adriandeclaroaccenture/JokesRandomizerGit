//
//  Jokes.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//

import Foundation

struct Jokes: Codable {

    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
