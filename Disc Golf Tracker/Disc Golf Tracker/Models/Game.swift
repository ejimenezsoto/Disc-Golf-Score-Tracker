//
//  game.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/28/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

struct Hole: Codable {
    let number: Int
    var par: Int = 3
    var strokes: [Int?] = []
    
    init (holeNum: Int, numPlayers: Int) {
        var newStrokes = Array<Int?>()
        for _ in (0..<numPlayers) {
            newStrokes.append(nil)
        }
        self.strokes = newStrokes
        self.number = holeNum
    }
}

struct Game : Codable {
    var numHoles: Int
    var numPlayers: Int
    var name: String
    var holes: [Hole] = []
    
    init (numHoles: Int, numPlayers: Int, name: String) {
        self.numHoles = numHoles
        self.numPlayers = numPlayers
        self.name = name
        var newHoles: [Hole] = Array<Hole>()
        for holeNum in (1...numHoles) {
            let newHole = Hole(holeNum: holeNum, numPlayers: numPlayers)
            newHoles.append(newHole)
        }
        holes = newHoles
    }
}