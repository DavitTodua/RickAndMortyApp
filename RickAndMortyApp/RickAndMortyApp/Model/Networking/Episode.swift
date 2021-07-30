//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by David Todua on 28.07.21.
//

import Foundation

class Episode: Codable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
    var fetchedCharacters:[Character] = []

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case airDate = "air_date"
        case episode, characters, url, created
    }
    
     func appendCharacter(character:Character) {
        fetchedCharacters.append(character)
    }
}
