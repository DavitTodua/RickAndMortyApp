//
//  Character.swift
//  RickAndMortyApp
//
//  Created by David Todua on 29.07.21.
//

import UIKit

// MARK: - Welcome
class Character: Codable {
    let id: Int
    let name, status, species, type: String
    let gender: String
    //let origin, location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    
    var fetchImage: ImageWrapper?
    
    enum CodingKeys: String, CodingKey {
        case id,name,status,species,type,gender,image,episode,url,created
        
       }
}

struct ImageWrapper {
    var image: UIImage
}

//// MARK: - Location
//struct Location: Codable {
//    let name: String
//    let url: String
//}
