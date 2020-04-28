//
//  File.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class NewGame {
    var courseName: String
    var numberOfHoles: String
    var numberOfPlayers: String
    
    init(courseName: String, numberOfHoles: String, numberOfPlayers: String){
        self.courseName = courseName
        self.numberOfHoles = numberOfHoles
        self.numberOfPlayers = numberOfPlayers
    }
}
