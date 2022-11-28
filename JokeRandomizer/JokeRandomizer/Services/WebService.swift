//
//  WebService.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/28/22.
//

import Foundation

enum JokesError: Error {
    case invalidServerResponse
}


class WebService {
    func getJokes(url: URL) async throws -> [Jokes] {
        
       let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse?,
                  httpResponse?.statusCode == 200 else {
                throw JokesError.invalidServerResponse
            }
        return try JSONDecoder().decode([Jokes].self, from: data)
    }
}
