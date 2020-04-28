//
//  NewGameViewController.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

protocol  AddNewGameDelegate {
    func newGameWasAdded(newGame: NewGame)
}

class NewGameViewController: UIViewController {

    
    @IBOutlet weak var courseNameTextField: UITextField!
    @IBOutlet weak var numberOfHolesTextField: UITextField!
    @IBOutlet weak var numberOfPlayersTextField: UITextField!
    
    
    @IBAction func createScorecardTapped(_ sender: Any) {
        
        
        guard let courseName = courseNameTextField.text, !courseName.isEmpty else {return}
        guard let numberOfHoles = numberOfHolesTextField.text, !numberOfHoles.isEmpty else {return}
        guard let numberOfPlayers = numberOfPlayersTextField.text, !numberOfPlayers.isEmpty else {return}
        
        let newGame = NewGame(courseName: courseName, numberOfHoles: numberOfHoles, numberOfPlayers: numberOfPlayers)
        
        delagate?.newGameWasAdded(newGame: newGame)
        
        
        dismiss(animated: true, completion: nil)
        
        navigationController?.popViewController(animated: true)
        
        }
    
    
    
    
    
    var delagate: AddNewGameDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseNameTextField.delegate = self
        numberOfHolesTextField.delegate = self
        numberOfPlayersTextField.delegate = self

        
    }

}

extension NewGameViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        guard let courseName = courseNameTextField.text, !courseName.isEmpty else {return false}
        guard let numberOfHoles = numberOfHolesTextField.text, !numberOfHoles.isEmpty else {return false}
        guard let numberOfPlayers = numberOfPlayersTextField.text, !numberOfPlayers.isEmpty else {return false}
        
        let newGame = NewGame(courseName: courseName, numberOfHoles: numberOfHoles, numberOfPlayers: numberOfPlayers)
            
            delagate?.newGameWasAdded(newGame: newGame)
            
            dismiss(animated: true, completion: nil)
            
            navigationController?.popViewController(animated: true)
        
            return true
    }
}
