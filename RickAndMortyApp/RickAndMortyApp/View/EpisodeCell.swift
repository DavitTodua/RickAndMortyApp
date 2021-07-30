//
//  TableViewCell.swift
//  RickAndMortyApp
//
//  Created by David Todua on 21.07.21.
//

import UIKit

class EpisodeCell: UITableViewCell {

    @IBOutlet weak var episodeIdLabel: UILabel!
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    @IBOutlet weak var episodeAirDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
