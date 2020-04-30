//
//  HolesTableViewController.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

protocol  AddGameDelegate {
    func newGameWasAdded(newGame: Game)
}

class HolesTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    //MARK: - Properties
    var gameController: GameController?
    var game: Game?
    var gameIndex: Int? {
        guard let gameController = gameController,
            let game = game,
            let gameIndex = gameController.games.firstIndex(of: game) else { return nil }
        return gameIndex
    }
    private var currentPlayer = 0 {
        didSet{
            tableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print (mySegmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        self.currentPlayer = mySegmentedControl.selectedSegmentIndex
        print (mySegmentedControl.selectedSegmentIndex)
    }
    var delegate: AddGameDelegate?
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        guard let gameIndex = self.gameIndex else { return 0 }
        gameController?.loadFromPersistentStore()
        gameController?.saveToPersistentStore()
        return gameController?.games[gameIndex].holes.count ?? 0
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HolesViewCell", for: indexPath) as? HolesTableViewCell,
            let gameIndex = gameIndex,
            let hole = gameController?.games[gameIndex].holes[indexPath.row]
        else {fatalError()}
    
        cell.delegate = self
        cell.currentPlayer = currentPlayer
        cell.hole = hole
        gameController?.loadFromPersistentStore()
        gameController?.saveToPersistentStore()
        return cell
    }
}

extension HolesTableViewController: HolesTableViewCellDelegate {
    func strokesEdited(hole: Hole, player: Int, strokes: Int) {
        guard let game = game else { return }
        gameController?.updateStrokes(for: hole, player: player, game: game, strokes: strokes)
        gameController?.loadFromPersistentStore()
        gameController?.saveToPersistentStore()
    }
    
    func parEdited(par: Int) {
        
    }
}




