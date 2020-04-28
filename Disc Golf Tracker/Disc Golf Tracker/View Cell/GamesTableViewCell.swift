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
    
    var newGame: NewGame? {
        didSet {
            updateViews()
        }
        
    }
    
    func updateViews() {
        if let newgame = newGame {
            NameTableViewLabel.text = newGame?.courseName
            playersTableViewLabel.text = newGame?.numberOfPlayers
            numberOfHolesTableLabel.text = newGame?.numberOfHoles
            
        }
    }
}
