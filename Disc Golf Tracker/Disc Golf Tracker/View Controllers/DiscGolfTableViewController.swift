//
//  DiscGolfTableViewController.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class DiscGolfTableViewController: UITableViewController {
    var gameController = GameController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameController.games.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GamesTableViewCell", for: indexPath) as? GamesTableViewCell else {fatalError("oops")}
        
        let game = gameController.games[indexPath.row]
        cell.game = game
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showNewGameSegue" {
            guard let newGameVC = segue.destination as? NewGameViewController else {return}
            
            newGameVC.delegate = self
        }
        else if segue.identifier == "showHolesSegue"{
            guard let holesVC = segue.destination as? HolesTableViewController,
                let indexPath = tableView.indexPathForSelectedRow
                else {return}
            
            holesVC.game = gameController.games[indexPath.row]
            
        }
    }
    
    
    
}

extension DiscGolfTableViewController: AddNewGameDelegate {
    func newGameWasAdded(newGame: Game) {
        gameController.addGame(game: newGame)
        tableView.reloadData()
    }
}



