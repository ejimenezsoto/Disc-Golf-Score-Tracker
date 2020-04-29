//
//  HolesTableViewCell.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

protocol HolesTableViewCellDelegate {
    func strokesEdited(strokes: Int)
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
        guard let hole = hole else { return }
        holeNumberLabel.text = "Hole \(hole.number)"
        strokesTextField.text = "\(hole.strokes[0] ?? 0)"
        parTextField.text = "\(hole.par)"
    }
    @IBAction func holesEdited(_ sender: UITextField) {
        
    }
    
}
