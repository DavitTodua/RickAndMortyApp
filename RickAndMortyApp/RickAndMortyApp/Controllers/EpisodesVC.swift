//
//  EpisodesVC.swift
//  RickAndMortyApp
//
//  Created by David Todua on 21.07.21.
//

import UIKit

class EpisodesVC: UIViewController {
   
    @IBOutlet weak var episodesTable: UITableView!

    var networkManager:NetworkManager?
    var episodes:AllEpisodes?
    
    override func viewDidLoad() {
        networkManager = NetworkManager(delegate: self)
        networkManager!.fetchEpisodes()
        episodesTable.delegate = self
        episodesTable.dataSource = self
        episodesTable.register(UINib(nibName: "EpisodeCell", bundle: nil), forCellReuseIdentifier: "EpisodeCell")
            
    }
    
       
    
}

extension EpisodesVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell") as! EpisodeCell
        let episode = episodes?.results[indexPath.row]

        cell.episodeIdLabel.text = "Episode " + String(Int(episode?.id ?? 0)) + ":"
        cell.episodeAirDateLabel.text = episode?.airDate
        cell.episodeNameLabel.text = episode?.name

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EpisodeCharactersSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let currEpisode = episodes?.results[episodesTable.indexPathForSelectedRow?.row ?? 0] {
            let currSegue = segue.destination as! EpisodeCharacters
            let networkManager2 = NetworkManager(delegate: currSegue as UIViewController)
            networkManager2.fetchEpisodeCharacters(episode: currEpisode)
            currSegue.currEpisode = currEpisode
        }
        
    }
    
    
}

