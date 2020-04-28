//
//  DiscGolfTableViewController.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class DiscGolfTableViewController: UITableViewController {
    
    var newGameArray: [NewGame] = [NewGame(courseName: "DeLa Vega Disc Golf Course", numberOfHoles: "18 holes", numberOfPlayers: "3 players")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newGameSegue" {
            guard let newGameVC = segue.destination as? NewGameViewController else {return}
            newGameVC.delagate = self
        
        }

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newGameArray.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GamesTableViewCell", for: indexPath) as? GamesTableViewCell else {fatalError("oops")}
        
        let newGame = newGameArray[indexPath.row]
        cell.newGame = newGame
        return cell
            }
        
    
}
extension DiscGolfTableViewController: AddNewGameDelegate {
    func newGameWasAdded(newGame: NewGame) {
        newGameArray.append(newGame)
        tableView.reloadData()
    }
}
