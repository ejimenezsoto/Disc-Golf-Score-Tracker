//
//  NewGameViewController.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

protocol  AddNewGameDelegate {
    func newGameWasAdded(newGame: Game)
}

class NewGameViewController: UIViewController {
    
    
    var delegate: AddNewGameDelegate?
    
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var numberOfHolesTextField: UITextField!
    @IBOutlet weak var numberOfPlayersTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createScorecardTapped(_ sender: Any) {
        
        
        guard let courseName = courseNameTextField.text, !courseName.isEmpty,
            let numberOfHoles = numberOfHolesTextField.text, !numberOfHoles.isEmpty,
            let numberOfHolesInt = Int(numberOfHoles),
            let numberOfPlayers = numberOfPlayersTextField.text, !numberOfPlayers.isEmpty,
            let numberOfPlayersInt = Int(numberOfPlayers) else {return}
        
        
        
        
        let newGame = Game(numHoles: numberOfHolesInt, numPlayers: numberOfPlayersInt, name: courseName)
        
        delegate?.newGameWasAdded(newGame: newGame)
        
        navigationController?.popViewController(animated: true)
        
        
        
        
    }
}

