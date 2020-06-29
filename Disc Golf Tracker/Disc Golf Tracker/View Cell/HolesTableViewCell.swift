//
//  HolesTableViewCell.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

protocol HolesTableViewCellDelegate {
    func strokesEdited(hole: Hole, player: Int, strokes: Int)
    func parEdited(par: Int)
}

class HolesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var holeNumberLabel: UILabel!
    
    @IBOutlet weak var strokesTextField: UITextField!
    
    @IBOutlet weak var parTextField: UITextField!
    
    public var hole: Hole? {
        didSet {
            updateViews()
        }
    }
    public var currentPlayer: Int?
    
    var delegate: HolesTableViewCellDelegate?
    
    func updateViews() {
        guard let hole = hole,
            let currentPlayer = currentPlayer else { return }
        holeNumberLabel.text = "Hole \(hole.number)"
        
        var strokesText = ""
        if let strokesInt = hole.strokes[currentPlayer] {
           strokesText = String(strokesInt)
        }
        strokesTextField.text = strokesText
        parTextField.text = "\(hole.par)"
    }
    
    @IBAction func holesEdited(_ sender: UITextField) {
        guard let strokesText = strokesTextField.text,
            !strokesText.isEmpty,
            let strokes = Int(strokesText),
            let hole = hole,
            let player = currentPlayer else { return }
        delegate?.strokesEdited(hole: hole,player: player, strokes: strokes)
    }
    
    @IBAction func parEdited(_ sender: UITextField) {
        guard let parText = parTextField.text, !parText.isEmpty,
        let par = Int(parText),
        let hole = hole,
            let player = currentPlayer else {return}
        delegate?.parEdited(par: par)
        
    }
    
    
}
