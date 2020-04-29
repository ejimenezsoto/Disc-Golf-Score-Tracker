//
//  HolesTableViewController.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class HolesTableViewController: UITableViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var myTableView: UITableView!
    
    //MARK: - Properties
    var gameController: GameController? = GameController()
    var game: Game?
    var currentUser = 0
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func segmentedValueChanged(_ sender: Any) {
        //Do Something
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return game?.holes.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "HolesViewCell", for: indexPath) as? HolesTableViewCell else {fatalError()}
        
        cell.hole = game?.holes[indexPath.row]
        cell.delegate = self
        cell.currentPlayer = currentUser
        
        return cell
    }
}

extension HolesTableViewController: HolesTableViewCellDelegate {
    func strokesEdited(strokes: Int) {
        //game.updateStrokesForHole(hole: Hole, strokes: Int)
    }
    
    func parEdited(par: Int) {
        
    }
    
    
}

 


