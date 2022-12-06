//
//  WebService.swift
//  JokeRandomizer
//
//  Created by john.adrian.de.claro on 11/28/22.
//

import Foundation
import Combine

enum JokesError: Error {
    case invalidServerResponse
}


class WebService {
    func getJokes(url: URL) async throws -> [JokesModel] {
        
       let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse?,
                  httpResponse?.statusCode == 200 else {
                throw JokesError.invalidServerResponse
            }
        return try JSONDecoder().decode([JokesModel].self, from: data)
    }
}
