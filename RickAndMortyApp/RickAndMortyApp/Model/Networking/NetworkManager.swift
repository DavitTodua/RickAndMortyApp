//
//  NetworkManager.swift
//  RickAndMortyApp
//
//  Created by David Todua on 27.07.21.
//

import Foundation
import Alamofire

struct NetworkManager {
    
    //let episode:AllEpisodes?
    let url = "https://rickandmortyapi.com/api/episode"
    let delegate: UIViewController?
    
    func fetchEpisodes() {
        let request = AF.request(url)
        let thisresponse = request.responseDecodable(of:AllEpisodes.self) { (response) in
            let episodes = response.value
            (delegate as! EpisodesVC).episodes = episodes
            (delegate as! EpisodesVC).episodesTable.reloadData()
        }
        
    }
    
     func fetchEpisodeCharacters(episode:Episode) {
        let sum = episode.characters.count-1
        let random = Int.random(in: 0...sum)
        for i in 0...sum {
            let request = AF.request(episode.characters[i])
            let thisresponse = request.responseDecodable(of:Character.self) { (response) in
                if let character = response.value {
                    episode.appendCharacter(character: character)
                    
                    (delegate as! EpisodeCharacters).charactersTable.reloadData()
                    //downloadImage
                    
                    if(i == random) {
                        let request = AF.request(character.image).validate().response { (response) in
                            var myImage = UIImage(data: response.data!)
                            character.fetchImage = ImageWrapper.init(image: myImage!)
                            (delegate as! EpisodeCharacters).addImage(image: myImage!)
                            
                        }
                    }
                    
                    let request = AF.request(character.image).validate().response { (response) in
                        var myImage = UIImage(data: response.data!)
                        character.fetchImage = ImageWrapper.init(image: myImage!)
                        (delegate as! EpisodeCharacters).charactersTable.reloadData()
                    }
                    
                    
                    
                }
            }
            
        }
    }
    
    
    
}
