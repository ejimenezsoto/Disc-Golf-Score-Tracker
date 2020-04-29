//
//  GameControlelr.swift
//  Disc Golf Tracker
//
//  Created by Enzo Jimenez-Soto on 4/29/20.
//  Copyright © 2020 Enzo Jimenez-Soto. All rights reserved.
//

import Foundation

class GameController {
    private (set) var games: [Game] = [Game(numHoles: 18, numPlayers: 2, name: "DeLa Vega")]
    
    init () {
    }
    
    //CRUD
    //MARK : - Public Methods
    //Create
    @discardableResult public func addGame(game: Game) -> Game {
           games.append(game)
           //saveToPersistentStore()
           return game
       }
    @discardableResult public func addGame(name: String, numPlayers: Int, numHoles: Int) -> Game {
        let game = Game(numHoles: numHoles, numPlayers: numPlayers, name: name)
        games.append(game)
        //saveToPersistentStore()
        return game
    }
    
    //Read?
    //Update?
    //Delete?
    
    //MARK: - Persistent Store
}
