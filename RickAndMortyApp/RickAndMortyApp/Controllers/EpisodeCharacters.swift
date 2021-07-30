//
//  EpisodeView.swift
//  RickAndMortyApp
//
//  Created by David Todua on 29.07.21.
//

import UIKit

class EpisodeCharacters: UIViewController {
    
    
    @IBOutlet weak var charactersTable: UITableView!
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var EpisodeNameLabel: UILabel!
    
    var currEpisode:Episode?
    var networkManager:NetworkManager?
    
    override func viewDidLoad() {
        charactersTable.dataSource = self
        charactersTable.delegate = self
        EpisodeNameLabel.text = currEpisode?.name
        
    }
    func addImage(image:UIImage) {
        mainImage.image = image
    }
}

extension EpisodeCharacters: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currEpisode?.fetchedCharacters.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell")
        cell?.textLabel?.text = currEpisode?.fetchedCharacters[indexPath.row].name
        cell?.textLabel?.textColor = UIColor.init(named: "White")
        if let myImage = currEpisode?.fetchedCharacters[indexPath.row].fetchImage?.image {
            cell?.imageView?.image = myImage
        }
        return cell!
    }
    
    func updateImage(row:Int) {
        currEpisode?.fetchedCharacters[row].fetchImage?.image
    }
    
}
