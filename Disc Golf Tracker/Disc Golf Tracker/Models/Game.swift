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
    var par: Int
    var strokes: [Int?] = []
    
    init (holeNum: Int, numPlayers: Int, par: Int) {
        var newStrokes = Array<Int?>()
        for _ in (0..<numPlayers) {
            newStrokes.append(nil)
        }
        self.strokes = newStrokes
        self.number = holeNum
        self.par = par
    }
}
extension Hole: Equatable {
    static func == (lhs: Hole, rhs: Hole) -> Bool {
        return lhs.number == rhs.number
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
            let newHole = Hole(holeNum: holeNum, numPlayers: numPlayers, par: 3 )
            newHoles.append(newHole)
        }
        holes = newHoles
    }
}
extension Game: Equatable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.name == rhs.name
    }
}
