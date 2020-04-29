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
    func updateStrokes(for hole: Hole, player: Int, game: Game, strokes: Int) {
        guard let gameIndex = games.firstIndex(of: game),
            let holeIndex = games[gameIndex].holes.firstIndex(of: hole) else { return }
        games[gameIndex].holes[holeIndex].strokes[player] = strokes
    }
    
    //Delete?
    
    //MARK: - Persistent Store
}
