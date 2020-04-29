//
//  GamesTableViewCell.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class GamesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var NameTableViewLabel: UILabel!
    @IBOutlet weak var playersTableViewLabel: UILabel!
    @IBOutlet weak var numberOfHolesTableLabel: UILabel!
    @IBOutlet weak var dateTableLabel: UILabel!
    
    let timeStamp = "\(DateFormatter.localizedString(from: Date(), dateStyle: .long, timeStyle: .short))"
    var game: Game? {
        didSet {
            updateViews()
        }
        
    }
    
    func updateViews() {
        if let game = game  {
            NameTableViewLabel.text = "\(game.name) Disc Golf Course"
            playersTableViewLabel.text = "\(String(game.numPlayers)) Players"
            numberOfHolesTableLabel.text = "\(String(game.numHoles)) Holes"
            dateTableLabel.text = timeStamp
        }
    }
}
