//
//  Jokes.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/24/22.
//

import Foundation

struct JokesModel: Decodable {

    let id: Int
    let type: String
    let setup: String
    let punchline: String
}
