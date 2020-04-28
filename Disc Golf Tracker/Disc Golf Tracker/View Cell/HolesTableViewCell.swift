//
//  HolesTableViewCell.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import UIKit

class HolesTableViewCell: UITableViewCell {

    @IBOutlet weak var holeNumberTableLabel: UILabel!
    
    @IBOutlet weak var strokesStepper: UIStepper!
    
    
    @IBOutlet weak var parStepper: UIStepper!
    
    @IBOutlet weak var strokesTextField: UITextField!
    
    @IBOutlet weak var parTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
      override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
